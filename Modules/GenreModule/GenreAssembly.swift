//
//  GenreAssembly.swift
//  myLibri
//
//  Created by Daniil Konashenko on 05.05.2023.
//
import UIKit

class GenreAssembly{
    static func configure() -> UIViewController {
        let interactor = GenreInteractor()
        let router = GenreRouter()
        let presenter = GenrePresenter(router: router, interactor: interactor)
        let view = GenreViewController()
        
        view.presenter = presenter
        presenter.view = view
        interactor.presenter = presenter
        router.view = view
        
        return view
    }
}
