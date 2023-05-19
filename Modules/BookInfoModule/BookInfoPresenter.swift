//
//  BookInfoPresenter.swift
//  myLibri
//
//  Created by Daniil Konashenko on 19.05.2023.
//

import Foundation

protocol BookInfoPresenterProtocol: AnyObject {
    func viewDidLoaded()
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
    }
}
