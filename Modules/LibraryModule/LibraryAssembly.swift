//
//  LibraryAssembly.swift
//  myLibri
//
//  Created by Daniil Konashenko on 27.04.2023.
//

import UIKit

class LibraryAssembly{
   
    static func configure() -> UIViewController {
        let interactor = LibraryInteractor()
        let router = LibraryRouter()
        let presenter = LibraryPresenter(router: router, interactor: interactor)
        let view = LibraryViewController()
        
        view.presenter = presenter
        presenter.view = view
        interactor.presenter = presenter
        router.view = view
        
        return view
    }
}
