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
    func getBooks<T: CustomStringConvertible>(with idGenre: T) async throws -> Books?

}

protocol DownloadImage {
    func getImage<T: CustomStringConvertible>(idBook: T) async throws -> UIImage?

}

protocol DownloadBook {
    func downloadBook<T: CustomStringConvertible>(idBook: T) async throws -> Data?

}
