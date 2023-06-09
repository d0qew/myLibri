//
//  GenreInteractor.swift
//  myLibri
//
//  Created by Daniil Konashenko on 05.05.2023.
//

import UIKit

protocol GenreInteractorProtocol: AnyObject{
    func getBooks() async
}

class GenreInteractor {
    weak var presenter: GenrePresenterProtocol?
    var networkService: NetworkService
    let title: String
    let idGenre: Int?
    
    init(presenter: GenrePresenterProtocol? = nil, networkService: NetworkService, title: String, idGenre: Int?) {
        self.presenter = presenter
        self.networkService = networkService
        self.title = title
        self.idGenre = idGenre
    }
}

// MARK: - GenreInteractorProtocol
extension GenreInteractor: GenreInteractorProtocol {
    func getBooks() {
        Task.init {
            await presenter?.titleLoaded(with: title)
            guard let idGenre = idGenre else {
                return
            }
            let booksClosure = try await networkService
                .getBooks(with: idGenre)
            
            guard let books = booksClosure?.content else {
                return
            }
            
            var images: Dictionary<Int, UIImage> = [:]
            
            for book in books {
                if let image = try await networkService
                    .getImage(idBook: book.id) {
                    images[book.id] = image
                } else {
                    images[book.id] = UIImage(named: "book")
                }
            }
            
            let booksModel = BooksModel(books: books, images: images)
            await presenter?.booksLoaded(books: booksModel)
        }
    }
    
}

