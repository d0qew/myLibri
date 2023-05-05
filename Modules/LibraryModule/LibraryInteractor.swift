//
//  LibraryInteractor.swift
//  myLibri
//
//  Created by Daniil Konashenko on 27.04.2023.
//

import Foundation

protocol LibraryInteractorProtocol: AnyObject{
    
}

class LibraryInteractor {
    weak var presenter: LibraryPresenterProtocol?
    
}

//  MARK: - LibraryInteractorProtocol
extension LibraryInteractor: LibraryInteractorProtocol {
    
}
