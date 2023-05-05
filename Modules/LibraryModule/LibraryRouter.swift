//
//  LibraryRouter.swift
//  myLibri
//
//  Created by Daniil Konashenko on 27.04.2023.
//

import UIKit

protocol LibraryRouterProtocol: AnyObject {
    
}

class LibraryRouter {
    weak var view: LibraryViewControllerProtocol?
    
}

//MARK: - LibraryRouterProtocol
extension LibraryRouter: LibraryRouterProtocol {
    
}
