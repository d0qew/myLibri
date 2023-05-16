//
//  LibraryPresenter.swift
//  myLibri
//
//  Created by Daniil Konashenko on 27.04.2023.
//

import Foundation

protocol LibraryPresenterProtocol: AnyObject {
    func viewDidLoaded()
}

class LibraryPresenter {
    weak var view: LibraryViewControllerProtocol?
    var router: LibraryRouterProtocol
    var interactor: LibraryInteractor
    
    init(router: LibraryRouterProtocol, interactor:LibraryInteractor) {
        self.router = router
        self.interactor = interactor
    }
}

//  MARK: - LibraryPresenterProtocol
extension LibraryPresenter: LibraryPresenterProtocol {
    func viewDidLoaded() {
    }
}
