
//
//  BooksMarket.swift
//  myLibri
//
//  Created by Daniil Konashenko on 18.05.2023.
//

import UIKit

public final class BooksMarket {
    private static var instance: BooksMarket?
    static func shared() -> BooksMarket {
        if instance == nil {
            instance = BooksMarket()
        }
        return instance!
    }
    
    var imageCache = NSCache<NSString, UIImage>()
    
    private let token = "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJkMHFldyIsImlhdCI6MTY4NzAwNjM2MiwiZXhwIjoxNjg3MDQ5NTYyfQ.CeWSIzjqojRWKhh5nqEJcWxH944LqF_HWbeR3PmCH3s"
    
    private func setToken(for request: inout URLRequest, token: String) {
        request.setValue(
            "Bearer \(token)",
            forHTTPHeaderField: "Authorization"
        )
    }
}
//  MARK: - Download Genres
internal extension BooksMarket {
    func getGeners() async throws -> Genres? {
        let urlString = EndpointPath.genresDownload.url
        guard let url = URL(string: urlString) else {
            return nil
        }
        
        var request = URLRequest(url: url)
        setToken(for: &request, token: token)
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let genreJSON = try JSONDecoder().decode(Genres.self, from: data)
            return genreJSON
        } catch {
            print("--Error JSON decode \(error.localizedDescription)")
            return nil
        }
    }
}

//  MARK: - Download Books
internal extension BooksMarket {
    func getBooks(with idGenre: Int) async throws -> Books? {
        let urlString = EndpointPath.booksDownload.url
        guard var urlComponents = URLComponents(string: urlString) else {
            return nil
        }
        urlComponents.queryItems = [
            URLQueryItem(name: "page", value: "0"),
            URLQueryItem(name: "size", value: "7"),
            URLQueryItem(name: "genre_ids", value: String(idGenre))
        ]
        guard let url = urlComponents.url else {
            return nil
        }
        var request = URLRequest(url: url)
        setToken(for: &request, token: token)
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let booksJSON = try JSONDecoder().decode(Books.self, from: data)
            return booksJSON
        } catch {
            print("--Error JSON decode \(error.localizedDescription)")
            return nil
        }
    }
}

//  MARK: - Download Images
internal extension BooksMarket {
    func getImage(idBook: Int) async throws -> UIImage? {
        let urlString = String(format: EndpointPath.imageDownload.url, String(idBook))
        guard let url = URL(string: urlString) else {
            return nil
        }
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
            return cachedImage
        } else {
            var request = URLRequest(url: url)
            setToken(for: &request, token: token)
            
            let (data, _) = try await URLSession.shared.data(for: request)
            if let image = UIImage(data: data){
                self.imageCache.setObject(image, forKey: url.absoluteString as NSString)
                return image
            }else {
                return nil
                
            }
        }
    }
}

//  MARK: - Download Book's Data
internal extension BooksMarket {
    func dowloadBook(idBook: Int) async throws -> Data? {
        let urlString = String(format: EndpointPath.dataBookDownload.url, String(idBook))
        guard let url = URL(string: urlString) else {
            return nil
        }
        var request = URLRequest(url: url)
        setToken(for: &request, token: token)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        return data
    }
    
}
