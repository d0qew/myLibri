//
//  LibraryRouter.swift
//  myLibri
//
//  Created by Daniil Konashenko on 27.04.2023.
//

import UIKit

protocol LibraryRouterProtocol: AnyObject {
    
}

class LibraryRouter: LibraryRouterProtocol{
    
    weak var view: LibraryViewControllerProtocol?
}
