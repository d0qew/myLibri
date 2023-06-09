//
//  GenreAssembly.swift
//  myLibri
//
//  Created by Daniil Konashenko on 05.05.2023.
//

import UIKit

class GenreAssembly{
    static func configure(title: String, idGenre: Int?) -> UIViewController {
        let networkService = BooksMarket()
        let interactor = GenreInteractor(
            networkService: networkService,
            title: title,
            idGenre: idGenre
        )
        let router = GenreRouter()
        let presenter = GenrePresenter(
            router: router,
            interactor: interactor
        )
        let view = GenreViewController()
        
        view.presenter = presenter
        presenter.view = view
        interactor.presenter = presenter
        router.view = view
        
        return view
    }
    
}
