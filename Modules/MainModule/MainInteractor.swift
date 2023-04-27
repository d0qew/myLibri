//
//  MainInteractor.swift
//  myLibri
//
//  Created by Daniil Konashenko on 27.04.2023.
//

import Foundation

protocol MainInteractorProtocol: AnyObject{
}

class MainInteractor {
    weak var presenter: MainPresenterProtocol?
    
}

//  MARK: EXTENSION
extension MainInteractor: MainInteractorProtocol {
    
}
