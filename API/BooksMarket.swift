
//
//  BooksMarket.swift
//  myLibri
//
//  Created by Daniil Konashenko on 18.05.2023.
//

import UIKit

public final class BooksMarket {
    static let shared = BooksMarket()
    
    private let token = "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJkMHFldyIsImlhdCI6MTY4NDc4MTcxNywiZXhwIjoxNjg0ODI0OTE3fQ.8C2Urd_yldqoIJ6-VuiFNlrWa_-dl7FrVY-jnTCpevc"
    var imageCache = NSCache<NSString, UIImage>()
    
    func getBooks(with idGenre: Int) async throws -> Books? {
        guard let url = URL(string: "http://localhost:8080/api/books?page=0&size=5&genre_ids=\(idGenre)") else {
            return nil
        }
        
        var request = URLRequest(url: url)
        request.setValue(
            "Bearer \(token)",
            forHTTPHeaderField: "Authorization"
        )
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let booksJSON = try JSONDecoder().decode(Books.self, from: data)
            return booksJSON
        } catch {
            print("--Error JSON decode \(error.localizedDescription)")
            return nil
        }
    }
    
    func getGeners() async throws -> Genres? {
        guard let url = URL(string: "http://localhost:8080/api/genres") else {
            return nil
        }
        var request = URLRequest(url: url)
        request.setValue(
            "Bearer \(token)",
            forHTTPHeaderField: "Authorization"
        )
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let genreJSON = try JSONDecoder().decode(Genres.self, from: data)
            return genreJSON
        } catch {
            print("--Error JSON decode \(error.localizedDescription)")
            return nil
        }
    }
    
    func getImage(idBook: Int) async throws -> UIImage? {
        guard let url = URL(string: "http://localhost:8080/api/binary-content/\(idBook)/image") else {
            return UIImage(named: "book")
        }
        // check cached image
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
            return cachedImage
        } else {
            
            var request = URLRequest(url: url)
            request.setValue(
                "Bearer \(token)",
                forHTTPHeaderField: "Authorization"
            )
            
            let (data, _) = try await URLSession.shared.data(for: request)
            if let image = UIImage(data: data){
                self.imageCache.setObject(image, forKey: url.absoluteString as NSString)
                return image
            }else {
                return UIImage(named: "book")
            }
        }
    }
    
    func dowloadBook(idBook: Int) async throws -> Data? {
        guard let url = URL(string: "http://localhost:8080/api/binary-content/\(idBook)/raw") else {
            return nil
        }
        var request = URLRequest(url: url)
        request.setValue(
            "Bearer \(token)",
            forHTTPHeaderField: "Authorization"
        )
        
        let (data, _) = try await URLSession.shared.data(for: request)
        return data
    }
    
}
