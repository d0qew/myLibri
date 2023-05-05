//
//  GenreRouter.swift
//  myLibri
//
//  Created by Daniil Konashenko on 05.05.2023.
//

import UIKit

protocol GenreRouterProtocol: AnyObject {
    
}

class GenreRouter {
    weak var view: GenreViewControllerProtocol?
    
}

// MARK: - GenreRouterProtocol
extension GenreRouter: GenreRouterProtocol {
    
}
