//
//  MainAssembly.swift
//  myLibri
//
//  Created by Daniil Konashenko on 27.04.2023.
//

import UIKit

class MainAssembly{
   
    static func configure() -> UIViewController {
        let interactor = MainInteractor()
        let router = MainRouter()
        let presenter = MainPresenter(router: router, interactor: interactor)
        let view = MainViewController()
        
        view.presenter = presenter
        presenter.view = view
        interactor.presenter = presenter
        router.view = view
        
        return view
    }
}

