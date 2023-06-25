//
//  BookInfoInteractor.swift
//  myLibri
//
//  Created by Daniil Konashenko on 19.05.2023.
//

import UIKit

protocol BookInfoInteractorProtocol: AnyObject{
    func getInfoBook() async
    func downloadBook() async
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
        Task.init {
            if let image = try await BooksMarket
                    .shared()
                    .getImage(idBook: self.book.id) {
                await self.presenter?.bookLoaded(book: book, image: image)
            } else {
                await self.presenter?.bookLoaded(book: book, image: UIImage(named: "book"))
            }
        }
    }
    
    func downloadBook() {
        Task.init {
            guard let book = try await BooksMarket
                    .shared()
                    .dowloadBook(idBook: self.book.id) else {
                return
            }
        }
    }
    
}