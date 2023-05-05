//
//  GenreInteractor.swift
//  myLibri
//
//  Created by Daniil Konashenko on 05.05.2023.
//

import Foundation

protocol GenreInteractorProtocol: AnyObject{
    
}

class GenreInteractor {
    weak var presenter: GenrePresenterProtocol?
    
}

// MARK: - GenreInteractorProtocol
extension GenreInteractor: GenreInteractorProtocol {
    
}
