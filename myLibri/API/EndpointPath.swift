//
//  EndpointPath.swift
//  myLibri
//
//  Created by Daniil Konashenko on 17.06.2023.
//

import Foundation

enum EndpointPath {
    case genresDownload
    case booksDownload
    case imageDownload
    case dataBookDownload
    
    var url: String {
        switch self {
        case .genresDownload:
            return "http://localhost:8080/api/genres"
        case .booksDownload:
            return "http://localhost:8080/api/books"
        case .imageDownload:
            return "http://localhost:8080/api/binary-content/%@/image"
        case .dataBookDownload:
            return "http://localhost:8080/api/binary-content/%@/raw"
        }
    }
}
