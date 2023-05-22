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
        presenter?.bookLoaded(book: book)
        Task.init {
            let image = try await BooksMarket.shared.getImage(idBook: self.book.id)
            self.presenter?.imageLoaded(image: image)
        }
    }
    
    func dowloadBook() {
        Task.init {
            let bookDowlanded = try await BooksMarket.shared.dowloadBook(idBook: self.book.id)
            print(bookDowlanded!)
        }
    }
    
}
