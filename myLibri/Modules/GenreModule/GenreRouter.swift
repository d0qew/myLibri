//
//  GenreRouter.swift
//  myLibri
//
//  Created by Daniil Konashenko on 05.05.2023.
//

import UIKit

protocol GenreRouterProtocol: AnyObject {
    func openBook(with book: Book)
}

class GenreRouter {
    weak var view: GenreViewController?
}

// MARK: - GenreRouterProtocol
extension GenreRouter: GenreRouterProtocol {
    func openBook(with book: Book) {
        let vc = BookInfoAssembly.configure(book: book)
        view?
            .navigationController?
            .pushViewController(vc, animated: true)
    }
    
}
