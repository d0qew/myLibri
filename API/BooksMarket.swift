
//
//  BooksMarket.swift
//  myLibri
//
//  Created by Daniil Konashenko on 18.05.2023.
//

import UIKit

public final class BooksMarket {
    static let shared = BooksMarket()
    
    var imageCache = NSCache<NSString, UIImage>()
    
    func getBooks(with idGenre: Int, completion: @escaping (Books) -> Void) {
        let token = "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJkMHFldyIsImlhdCI6MTY4NDUwODM1MiwiZXhwIjoxNjg0NTUxNTUyfQ.4w_Huoo62FkK0ZMctp8Xh-Ddw6MvT9sSf_iZi-c8hcI"
        guard let url = URL(string: "http://localhost:8080/api/books?page=0&size=5&genre_ids=\(idGenre)") else {
            return
        }
        var request = URLRequest(url: url)
        request.setValue("Bearer \(token)",
                         forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                return
            }
            do {
                let booksJSON = try JSONDecoder().decode(Books.self, from: data)
                completion(booksJSON)
            }catch {
                print("--Error JSON decode \(error.localizedDescription)")
            }
        }.resume()
    }
    
    func getGeners(completion: @escaping (Genres) -> Void) {
        let token = "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJkMHFldyIsImlhdCI6MTY4NDUwODM1MiwiZXhwIjoxNjg0NTUxNTUyfQ.4w_Huoo62FkK0ZMctp8Xh-Ddw6MvT9sSf_iZi-c8hcI"
        guard let url = URL(string: "http://localhost:8080/api/genres") else {
            return
        }
        var request = URLRequest(url: url)
        request.setValue("Bearer \(token)",
                         forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                return
            }
            do {
                let genreJSON = try JSONDecoder().decode(Genres.self, from: data)
                completion(genreJSON)
            }catch {
                print("--Error JSON decode \(error.localizedDescription)")
            }
        }.resume()
    }
    
    func getImage(idBook: Int, completion: @escaping (UIImage?) -> Void) {
        let token = "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJkMHFldyIsImlhdCI6MTY4NDUwODM1MiwiZXhwIjoxNjg0NTUxNTUyfQ.4w_Huoo62FkK0ZMctp8Xh-Ddw6MvT9sSf_iZi-c8hcI"
        guard let url = URL(string: "http://localhost:8080/api/binary-content/\(idBook)/image") else {
            return
        }
        // check cached image
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
            completion(cachedImage)
        } else {
            var request = URLRequest(url: url)
            request.setValue("Bearer \(token)",
                             forHTTPHeaderField: "Authorization")
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else {
                    return
                }
                guard let image = UIImage(data: data) else { return }
                self.imageCache.setObject(image, forKey: url.absoluteString as NSString)
                DispatchQueue.main.async {
                    completion(image)
                }
                
            }.resume()
        }
    }
}
