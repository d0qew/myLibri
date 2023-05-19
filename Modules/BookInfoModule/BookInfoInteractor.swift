//
//  BookInfoInteractor.swift
//  myLibri
//
//  Created by Daniil Konashenko on 19.05.2023.
//

import Foundation

protocol BookInfoInteractorProtocol: AnyObject{
    func getInfoBook()
}

class BookInfoInteractor {
    weak var presenter: BookInfoPresenterProtocol?
    let book: Book
    init(book: Book) {
        self.book = book
    }
}

//  MARK: - BookInfoInteractorProtocol
extension BookInfoInteractor: BookInfoInteractorProtocol {
    func getInfoBook() {
        presenter?.bookLoaded(book: book)
        BooksMarket.shared.getImage(idBook: self.book.id) { image in
            self.presenter?.imageLoaded(image: image)
        }
    }
}
