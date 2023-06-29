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
    var networkService: NetworkService
    
    init(presenter: BookInfoPresenterProtocol? = nil, book: Book, networkService: NetworkService) {
        self.presenter = presenter
        self.book = book
        self.networkService = networkService
    }
    
}

//  MARK: - BookInfoInteractorProtocol
extension BookInfoInteractor: BookInfoInteractorProtocol {
    func getInfoBook() {
        Task.init {
            if let image = try await networkService
                    .getImage(idBook: self.book.id) {
                await self.presenter?.bookLoaded(book: book, image: image)
            } else {
                await self.presenter?.bookLoaded(book: book, image: UIImage(named: "book"))
            }
        }
    }
    
    func downloadBook() {
        Task.init {
            guard let book = try await networkService
                    .downloadBook(idBook: self.book.id) else {
                return
            }
        }
    }
    
}
