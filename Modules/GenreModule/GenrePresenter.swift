//
//  GenrePresenter.swift
//  myLibri
//
//  Created by Daniil Konashenko on 05.05.2023.
//

import Foundation

protocol GenrePresenterProtocol: AnyObject {
    func viewDidLoaded()
    func titleLoaded(with title: String) async
    func booksLoaded(books: BooksModel) async
    func didSelectItem(with book: Book)
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

//  MARK: - GenrePresenterProtocol
extension GenrePresenter: GenrePresenterProtocol {
    func viewDidLoaded() {
        interactor.getBooks()
    }

    func titleLoaded(with title: String) async {
        await self.view?.updateView(with: title)
    }
    
    func booksLoaded(books: BooksModel) async {
        await self.view?.updateCollectionView(with: books)
    }
    
    func didSelectItem(with book: Book) {
        router.openBook(with: book)
    }
    
}
