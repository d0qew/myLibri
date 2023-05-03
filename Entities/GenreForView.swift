//
//  GenreForView.swift
//  myLibri
//
//  Created by Daniil Konashenko on 29.04.2023.
//

import UIKit

// MARK: - ListItem
struct ListItem {
    let title: String
    let image: UIImage?
}

// MARK: - ListSection
enum ListSection {
    case artisticLiterature([ListItem])
    case nonFiction([ListItem])
    case childrenLiterature([ListItem])
    
    var items: [ListItem] {
        switch self {
        case .artisticLiterature(let items),
                .nonFiction(let items),
                .childrenLiterature(let items):
            return items
        }
    }
    
    var count: Int {
        return items.count
    }
    
    var title: String {
        switch self {
        case .artisticLiterature:
            return "Художественная литература"
        case .nonFiction:
            return "Нон-фикшен"
        case .childrenLiterature:
            return "Детская литература"
        }
    }
}

// MARK: - GenreData
struct GenreData {
    static let shared = GenreData()
    
    private let artisticLiterature: ListSection = {
        .artisticLiterature([.init(title: "Фэнтези", image: UIImage(named: "bookBackground")),
                             .init(title: "Детективы", image: UIImage(named: "bookBackground")),
                             .init(title: "Эротика", image: UIImage(named: "bookBackground")),
                             .init(title: "Ужасы", image: UIImage(named: "bookBackground")),
                             .init(title: "Приключения", image: UIImage(named: "bookBackground")),
                             .init(title: "Поэзия", image: UIImage(named: "bookBackground")),
                             .init(title: "Фантастика", image: UIImage(named: "bookBackground")),
                             .init(title: "Любовные романы", image: UIImage(named: "bookBackground")),
                             .init(title: "Триллеры", image: UIImage(named: "bookBackground")),
                             .init(title: "Комиксы и манга", image: UIImage(named: "bookBackground")),
                             .init(title: "Проза", image: UIImage(named: "bookBackground"))])
    }()
    
    private let nonFiction: ListSection = {
        .nonFiction([.init(title: "Бизнес-литература", image: UIImage(named: "bookBackground")),
                     .init(title: "Психология", image: UIImage(named: "bookBackground")),
                     .init(title: "Искусство и культура", image: UIImage(named: "bookBackground")),
                     .init(title: "Научная литература", image: UIImage(named: "bookBackground")),
                     .init(title: "Хобби и досуг", image: UIImage(named: "bookBackground")),
                     .init(title: "Изучение языков", image: UIImage(named: "bookBackground")),
                     .init(title: "Компьютерная литература", image: UIImage(named: "bookBackground")),
                     .init(title: "История", image: UIImage(named: "bookBackground")),
                     .init(title: "Общество", image: UIImage(named: "bookBackground")),
                     .init(title: "Мемуары", image: UIImage(named: "bookBackground")),
                     .init(title: "Красота и здоровье", image: UIImage(named: "bookBackground"))])
    }()
        
    private let childrenLiterature: ListSection = {
        .childrenLiterature([.init(title: "Книги для дошкольников", image: UIImage(named: "bookBackground")),
                             .init(title: "Внеклассное чтение", image: UIImage(named: "bookBackground")),
                             .init(title: "Детские приключенческие книги", image: UIImage(named: "bookBackground")),
                             .init(title: "Книги для школьников", image: UIImage(named: "bookBackground")),
                             .init(title: "Школьные учебники", image: UIImage(named: "bookBackground")),
                             .init(title: "Детские детективы", image: UIImage(named: "bookBackground")),
                             .init(title: "Книги для подростков", image: UIImage(named: "bookBackground"))
                            ])
    }()
    
    var pageData: [ListSection] {
        [artisticLiterature, nonFiction, childrenLiterature]
    }
}

