//
//  MainPresenter.swift
//  myLibri
//
//  Created by Daniil Konashenko on 27.04.2023.
//

import Foundation

protocol MainPresenterProtocol: AnyObject {
    func viewDidLoaded()
}

class MainPresenter {
    weak var view: MainViewControllerProtocol?
    var router: MainRouterProtocol
    var interactor: MainInteractor
    
    init(router: MainRouterProtocol, interactor: MainInteractor) {
        self.router = router
        self.interactor = interactor
    }
}

//  MARK: - MainPresenterProtocol
extension MainPresenter: MainPresenterProtocol {
    func viewDidLoaded() {
       
    }
}
