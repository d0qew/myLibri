//
//  BookInfoInteractor.swift
//  myLibri
//
//  Created by Daniil Konashenko on 19.05.2023.
//

import Foundation

protocol BookInfoInteractorProtocol: AnyObject{
    
}

class BookInfoInteractor {
    weak var presenter: BookInfoPresenterProtocol?
    
}

//  MARK: - BookInfoInteractorProtocol
extension BookInfoInteractor: BookInfoInteractorProtocol {
    
}
