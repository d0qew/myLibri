//
//  MainPresenter.swift
//  myLibri
//
//  Created by Daniil Konashenko on 27.04.2023.
//

import Foundation

protocol MainPresenterProtocol: AnyObject {
    func viewDidLoaded()
    func didSelectItem(with title: String)
    func genresLoaded(with dict: [String : Int])
}

class MainPresenter {
    weak var view: MainViewControllerProtocol?
    var router: MainRouterProtocol
    var interactor: MainInteractor
    
    var genresDictionary: [String : Int] = [:]
    
    init(router: MainRouterProtocol, interactor: MainInteractor) {
        self.router = router
        self.interactor = interactor
    }
    
}

//  MARK: - MainPresenterProtocol
extension MainPresenter: MainPresenterProtocol {
    func viewDidLoaded() {
        interactor.getGenres()
    }
    
    func didSelectItem(with title: String) {
        let idGenre = genresDictionary[title]
        router.openGenre(with: title,
                         idGenre: idGenre)
    }
    
    func genresLoaded(with dict: [String : Int]) {
        genresDictionary = dict
    }
    
}
