//
//  MainRouter.swift
//  myLibri
//
//  Created by Daniil Konashenko on 27.04.2023.
//

import UIKit

protocol MainRouterProtocol: AnyObject {
    
}

class MainRouter {
    weak var view: MainViewControllerProtocol?
}

//MARK: - MainRouterProtocol
extension MainRouter: MainRouterProtocol {
    
}
