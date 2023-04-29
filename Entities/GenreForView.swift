//
//  GenreForView.swift
//  myLibri
//
//  Created by Daniil Konashenko on 29.04.2023.
//

import UIKit

class GenreForView {
    var title: String
    var image: String
    
    init(title: String, image: String) {
        self.title = title
        self.image = image
    }
    
    func getImage()-> UIImage {
        return UIImage(named: image) ?? UIImage()
    }
}
