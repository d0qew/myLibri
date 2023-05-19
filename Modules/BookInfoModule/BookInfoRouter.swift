//
//  BookInfoRouter.swift
//  myLibri
//
//  Created by Daniil Konashenko on 19.05.2023.
//

import UIKit

protocol BookInfoRouterProtocol: AnyObject {
    
}

class BookInfoRouter {
    weak var view: BookInfoViewController?
    
}

// MARK: - BookInfoRouterProtocol
extension BookInfoRouter: BookInfoRouterProtocol {
    
}
