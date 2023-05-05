//
//  GenrePresenter.swift
//  myLibri
//
//  Created by Daniil Konashenko on 05.05.2023.
//

import Foundation

protocol GenrePresenterProtocol: AnyObject {
    func viewDidLoaded()
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
    func viewDidLoaded() {
        print("view did loaded")
    }
}
