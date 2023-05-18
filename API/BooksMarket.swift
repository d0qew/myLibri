
//
//  BooksMarket.swift
//  myLibri
//
//  Created by Daniil Konashenko on 18.05.2023.
//

import Foundation

public final class BooksMarket {
    static let shared = BooksMarket()
    func getBooks(with idGenre: Int, completion: @escaping (Books) -> Void) {
        let token = "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJkMHFldyIsImlhdCI6MTY4NDQwMjM0NSwiZXhwIjoxNjg0NDQ1NTQ1fQ.gEBRbHNa0DvriIEBIPX2EKLeSwRexapWddAwrNq2MnY"
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
                print(data)
                completion(booksJSON)
            }catch {
                print("--Error JSON decode \(error.localizedDescription)")
            }
        }.resume()
    }
}

