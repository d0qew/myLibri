//
//  GenreForView.swift
//  myLibri
//
//  Created by Daniil Konashenko on 29.04.2023.
//

import UIKit

class GenreForView {
    var title: String
    var image: UIImage?
    
    init(title: String, image: UIImage?) {
        self.title = title
        self.image = image
    }
}

let genresArray = [GenreForView(title: "Фэнтези", image: UIImage(named: "bookBackground")),
                   GenreForView(title: "Детективы", image: UIImage(named: "bookBackground")),
                   GenreForView(title: "Эротика", image: UIImage(named: "bookBackground")),
                   GenreForView(title: "Ужасы", image: UIImage(named: "bookBackground")),
                   GenreForView(title: "Приключения", image: UIImage(named: "bookBackground")),
                   GenreForView(title: "Поэзия", image: UIImage(named: "bookBackground")),
                   GenreForView(title: "Фантастика", image: UIImage(named: "bookBackground")),
                   GenreForView(title: "Любовные романы", image: UIImage(named: "bookBackground")),
                   GenreForView(title: "Триллеры", image: UIImage(named: "bookBackground")),
                   GenreForView(title: "Комиксы и манга", image: UIImage(named: "bookBackground")),
                   GenreForView(title: "Проза", image: UIImage(named: "bookBackground"))
]
