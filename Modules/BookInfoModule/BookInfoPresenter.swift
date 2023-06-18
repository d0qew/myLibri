//
//  BookInfoPresenter.swift
//  myLibri
//
//  Created by Daniil Konashenko on 19.05.2023.
//

import UIKit

protocol BookInfoPresenterProtocol: AnyObject {
    func viewDidLoaded()
    func bookLoaded(book: Book, image: UIImage?) async
    func buttonTapped()
}

class BookInfoPresenter {
    weak var view: BookInfoViewControllerProtocol?
    var router: BookInfoRouterProtocol
    var interactor: BookInfoInteractor
    
    init(router: BookInfoRouterProtocol, interactor:BookInfoInteractor) {
        self.router = router
        self.interactor = interactor
    }
    
}

//  MARK: - BookInfoPresenterProtocol
extension BookInfoPresenter: BookInfoPresenterProtocol {
    func viewDidLoaded() {
        interactor.getInfoBook()
    }
    
    func bookLoaded(book: Book, image: UIImage?) async {
        await view?.updateInfoBook(book: book, image: image)
    }
 
    func buttonTapped() {
        interactor.downloadBook()
    }
    
}
