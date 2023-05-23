//
//  BookInfoAssembly.swift
//  myLibri
//
//  Created by Daniil Konashenko on 19.05.2023.
//

import UIKit

class BookInfoAssembly{
    static func configure(book: Book) -> UIViewController {
        let interactor = BookInfoInteractor(book: book)
        let router = BookInfoRouter()
        let presenter = BookInfoPresenter(router: router, interactor: interactor)
        let view = BookInfoViewController()
        
        view.presenter = presenter
        presenter.view = view
        interactor.presenter = presenter
        router.view = view
        
        return view
    }
    
}
