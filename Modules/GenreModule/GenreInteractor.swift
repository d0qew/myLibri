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
    let title: String
    let idGenre: Int?
    
    init(title: String, idGenre: Int?) {
        self.title = title
        self.idGenre = idGenre
    }
    
}

// MARK: - GenreInteractorProtocol
@MainActor
extension GenreInteractor: GenreInteractorProtocol {
    func getBooks(){
        presenter?.titleLoaded(with: title)
        guard let idGenre = idGenre else {
            return
        }
        Task.init {
            let booksClosure = try await BooksMarket
                .shared()
                .getBooks(with: idGenre)
            
            guard let books = booksClosure?.content else {
                return
            }
            
            var images: Dictionary<Int, UIImage> = [:]
            
            for book in books {
                let image = try await BooksMarket
                    .shared()
                    .getImage(idBook: book.id)
                
                images[book.id] = image
            }
            
            let booksModel = BooksModel(books: books, images: images)
            presenter?.booksLoaded(books: booksModel)
        }
    }
    
}

