//
//  MainInteractor.swift
//  myLibri
//
//  Created by Daniil Konashenko on 27.04.2023.
//

import Foundation

protocol MainInteractorProtocol: AnyObject{
    func getGenres()
}

class MainInteractor {
    weak var presenter: MainPresenterProtocol?
}

//  MARK: - MainInteractorProtocol
extension MainInteractor: MainInteractorProtocol {
    func getGenres() {
        Task.init {
            let genres = BooksMarket.shared().getGeners
            var dict: [String: Int] = [:]
            for genre in try await genres()!.content {
                dict[genre.name] = genre.id
            }
            self.presenter?.genresLoaded(with: dict)
        }
    }
    
}
