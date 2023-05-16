//
//  MainRouter.swift
//  myLibri
//
//  Created by Daniil Konashenko on 27.04.2023.
//

import UIKit

protocol MainRouterProtocol: AnyObject {
    func openGenre(with title: String)
}

class MainRouter {
    weak var view: MainViewController?
}

//MARK: - MainRouterProtocol
extension MainRouter: MainRouterProtocol {
    func openGenre(with title: String) {
        let vc = GenreAssembly.configure(title: title)
        view?.navigationController?.pushViewController(vc, animated: true)
    }
}
