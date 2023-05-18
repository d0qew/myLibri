//
//  BooksStructDecode.swift
//  myLibri
//
//  Created by Daniil Konashenko on 18.05.2023.
//

import Foundation

struct Books: Decodable {
    let content: [Book]
    let totalPages: Int
}

struct Book: Decodable {
    let id: Int
    let name: String
    let description: String
    let authors: [Author]
    let genres: [Genre]
    let publisher: String
}

struct Author: Decodable {
    let id: Int
    let first_name: String
    let last_name: String
}

struct Genre: Decodable {
    let id: Int
    let name: String
}
