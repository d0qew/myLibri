
//
//  BooksMarket.swift
//  myLibri
//
//  Created by Daniil Konashenko on 18.05.2023.
//

import UIKit

protocol NetworkService: DownloadBook, DownloadBooks, DownloadImage, DownloadGeners {
    
}

public final class BooksMarket: NetworkService  {
    private var imageCache = NSCache<NSString, UIImage>()
    private let token = "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJkMHFldyIsImlhdCI6MTY4ODczNjc5MSwiZXhwIjoxNjg4Nzc5OTkxfQ.b452OpKIT4Oi_knVEr053Isvxbh0hHOnKVO7qYKBwVc"
    
    private enum NetworkResponse: String, Error {
        case success
        case authenticationError = "You need to be authenticated first."
        case badRequest          = "Bad request."
        case outdates            = "The url you requested is outdated."
        case failed              = "Network request failed."
        case noData              = "Response returned with no data to decode."
        case unabledToDecode     = "We could not decode the response."
    }
    
    private enum Result: Error {
        case success
        case failure(String)
    }
    
    private func handleNetworkResponse(_ response: HTTPURLResponse) -> Result {
        switch response.statusCode {
        case 200...299:
            return .success
        case 401...500:
            return .failure(NetworkResponse.authenticationError.rawValue)
        case 501...599:
            return .failure(NetworkResponse.badRequest.rawValue)
        case 600:
            return .failure(NetworkResponse.outdates.rawValue)
        default:
            return .failure(NetworkResponse.failed.rawValue)
        }
    }
    
    private func setToken(for request: inout URLRequest, token: String) {
        request.setValue(
            "Bearer \(token)",
            forHTTPHeaderField: "Authorization"
        )
    }
}

//  MARK: - Download Genres
extension BooksMarket {
    func getGeners() async throws -> Genres? {
        let urlString = EndpointPath.genresDownload.url
        guard let url = URL(string: urlString) else {
            throw NetworkError.missingURL
        }
        var request = URLRequest(url: url)
        setToken(for: &request, token: token)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let responseHTTP = response as? HTTPURLResponse else {
                throw NetworkError.badResponse
            }
            switch handleNetworkResponse(responseHTTP) {
                case .success:
                    let genreJSON = try JSONDecoder().decode(Genres.self, from: data)
                    return genreJSON
                case .failure(let error):
                    throw Result.failure(error)
            }
        } catch {
            throw NetworkError.nonConnection
        }
    }
}

//  MARK: - Download Books
extension BooksMarket {
    func getBooks<T: CustomStringConvertible>(with idGenre: T) async throws -> Books? {
        let urlString = EndpointPath.booksDownload.url
        guard var urlComponents = URLComponents(string: urlString) else {
            throw NetworkError.missingURL
        }
        urlComponents.queryItems = [
            URLQueryItem(name: "page", value: "0"),
            URLQueryItem(name: "size", value: "7"),
            URLQueryItem(name: "genre_ids", value: idGenre.description)
        ]
        guard let url = urlComponents.url else {
            return nil
        }
        var request = URLRequest(url: url)
        setToken(for: &request, token: token)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let responseHTTP = response as? HTTPURLResponse else {
                throw NetworkError.badResponse
            }
            switch handleNetworkResponse(responseHTTP) {
                case .success:
                    let booksJSON = try JSONDecoder().decode(Books.self, from: data)
                    return booksJSON
                case .failure(let error):
                    throw Result.failure(error)
            }
        } catch {
            print("--Error JSON decode \(error.localizedDescription)")
            return nil
        }
    }
}

//  MARK: - Download Images
extension BooksMarket {
    func getImage<T: CustomStringConvertible>(idBook: T) async throws -> UIImage? {
        let urlString = String(format: EndpointPath.imageDownload.url, idBook.description)
        guard let url = URL(string: urlString) else {
            return nil
        }
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
            return cachedImage
        } else {
            var request = URLRequest(url: url)
            setToken(for: &request, token: token)
            
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let responseHTTP = response as? HTTPURLResponse else {
                throw NetworkError.badResponse
            }
            switch handleNetworkResponse(responseHTTP) {
                case .success:
                    if let image = UIImage(data: data){
                        self.imageCache.setObject(image, forKey: url.absoluteString as NSString)
                        return image
                    } else {
                        return nil
                    }
                case .failure(let error):
                    throw Result.failure(error)
            }
        }
    }
}

//  MARK: - Download Book's Data
extension BooksMarket {
    func downloadBook<T: CustomStringConvertible>(idBook: T) async throws -> Data? {
        let urlString = String(format: EndpointPath.dataBookDownload.url, idBook.description)
        guard let url = URL(string: urlString) else {
            return nil
        }
        var request = URLRequest(url: url)
        setToken(for: &request, token: token)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let responseHTTP = response as? HTTPURLResponse else {
            throw NetworkError.badResponse
        }
        switch handleNetworkResponse(responseHTTP) {
        case .success:
            return data
        case .failure(let error):
            throw Result.failure(error)
        }
    }
}
