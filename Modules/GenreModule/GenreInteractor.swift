//
//  GenreInteractor.swift
//  myLibri
//
//  Created by Daniil Konashenko on 05.05.2023.
//

import Foundation

protocol GenreInteractorProtocol: AnyObject{
    func getBooks()
}

class GenreInteractor {
    weak var presenter: GenrePresenterProtocol?
    let title: String

    init(title: String) {
        self.title = title
    }
}

// MARK: - GenreInteractorProtocol
extension GenreInteractor: GenreInteractorProtocol {
    func getBooks() {
        presenter?.booksLoaded(with: title)
    }
}
