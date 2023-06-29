//
//  NetworkProtocol.swift
//  myLibri
//
//  Created by Daniil Konashenko on 29.06.2023.
//

import UIKit

protocol DownloadGeners {
    func getGeners() async throws -> Genres?

}

protocol DownloadBooks {
    func getBooks(with idGenre: CustomStringConvertible) async throws -> Books?

}

protocol DownloadImage {
    func getImage(idBook: CustomStringConvertible) async throws -> UIImage?

}

protocol DownloadBook {
    func downloadBook(idBook: CustomStringConvertible) async throws -> Data?

}
