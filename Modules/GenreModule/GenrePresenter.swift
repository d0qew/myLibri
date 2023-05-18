//
//  GenrePresenter.swift
//  myLibri
//
//  Created by Daniil Konashenko on 05.05.2023.
//

import Foundation

protocol GenrePresenterProtocol: AnyObject {
    
    func viewDidLoaded()
    func titleLoaded(with title: String)
    func booksLoaded(books: [Book])
}

class GenrePresenter {
    weak var view: GenreViewControllerProtocol?
    var router: GenreRouterProtocol
    var interactor: GenreInteractor
    
    init(router: GenreRouterProtocol, interactor: GenreInteractor) {
        self.router = router
        self.interactor = interactor
    }
}

// MARK: - GenrePresenterProtocol
extension GenrePresenter: GenrePresenterProtocol {
    func titleLoaded(with title: String) {
        self.view?.updateView(with: title)
    }
    
    func booksLoaded(books: [Book]) {
        self.view?.updateCollectionView(with: books)
    }
    
    func viewDidLoaded() {
        interactor.getBooks()
    }
}
