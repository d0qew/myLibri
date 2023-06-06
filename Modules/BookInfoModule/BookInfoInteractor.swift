//
//  BookInfoInteractor.swift
//  myLibri
//
//  Created by Daniil Konashenko on 19.05.2023.
//

import UIKit

protocol BookInfoInteractorProtocol: AnyObject{
    func getInfoBook() async
}

class BookInfoInteractor {
    weak var presenter: BookInfoPresenterProtocol?
    let book: Book
    init(book: Book) {
        self.book = book
    }
    
}

//  MARK: - BookInfoInteractorProtocol
@MainActor
extension BookInfoInteractor: BookInfoInteractorProtocol {
    func getInfoBook() {
        Task.init {
            let image = try await BooksMarket
                .shared()
                .getImage(idBook: self.book.id)
            
            self.presenter?.bookLoaded(book: book, image: image)
        }
    }
    
    func dowloadBook() {
        Task.init {
            guard let bookDowlanded = try await BooksMarket
                .shared()
                .dowloadBook(idBook: self.book.id) else {
                return
            }
            print(bookDowlanded)
        }
    }
    
}
