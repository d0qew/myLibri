//
//  MainInteractor.swift
//  myLibri
//
//  Created by Daniil Konashenko on 27.04.2023.
//

import Foundation

protocol MainInteractorProtocol: AnyObject{
    func getGenres() async
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
            if let genres = try await genresClosure()?.content {
                var dict: [String: Int] = [:]
                genres.forEach { genre in
                    dict[genre.name] = genre.id
                }
                self.presenter?.genresLoaded(with: dict)
            } else {
                await presenter?.nonConnection()
            }
        }
    }
}
