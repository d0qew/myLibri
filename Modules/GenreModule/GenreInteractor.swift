//
//  GenreInteractor.swift
//  myLibri
//
//  Created by Daniil Konashenko on 05.05.2023.
//

import Foundation


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
        
        if idGenre != nil {
            Task.init {
                let books = try await BooksMarket.shared.getBooks(with: idGenre!)
                presenter?.booksLoaded(books: books!.content)
            }
        }
    }
    
}
