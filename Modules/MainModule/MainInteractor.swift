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
            let genresClosure = BooksMarket
                .shared()
                .getGeners
            
            guard let genres = try await genresClosure()?.content else {
                //need create alert about bad connection with server
                return
            }
            var dict: [String: Int] = [:]
            for genre in genres {
                dict[genre.name] = genre.id
            }
            self.presenter?.genresLoaded(with: dict)
        }
    }
}
