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
    let image: String
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
        .artisticLiterature([.init(title: "Фэнтези", image: "bookBackground"),
                             .init(title: "Детективы", image: "bookBackground"),
                             .init(title: "Эротика", image: "bookBackground"),
                             .init(title: "Ужасы", image: "bookBackground"),
                             .init(title: "Приключения", image: "bookBackground"),
                             .init(title: "Поэзия", image: "bookBackground"),
                             .init(title: "Фантастика", image: "bookBackground"),
                             .init(title: "Любовные романы", image: "bookBackground"),
                             .init(title: "Триллеры", image: "bookBackground"),
                             .init(title: "Комиксы и манга", image: "bookBackground"),
                             .init(title: "Проза", image: "bookBackground")])
    }()
    
    private let nonFiction: ListSection = {
        .nonFiction([.init(title: "Бизнес-литература", image: "bookBackground"),
                     .init(title: "Психология", image: "bookBackground"),
                     .init(title: "Искусство и культура", image: "bookBackground"),
                     .init(title: "Научная литература", image: "bookBackground"),
                     .init(title: "Хобби и досуг", image: "bookBackground"),
                     .init(title: "Изучение языков", image: "bookBackground"),
                     .init(title: "Компьютерная литература", image: "bookBackground"),
                     .init(title: "История", image: "bookBackground"),
                     .init(title: "Общество", image: "bookBackground"),
                     .init(title: "Мемуары", image: "bookBackground"),
                     .init(title: "Красота и здоровье", image: "bookBackground")])
    }()
        
    private let childrenLiterature: ListSection = {
        .childrenLiterature([.init(title: "Книги для дошкольников", image: "bookBackground"),
                             .init(title: "Внеклассное чтение", image: "bookBackground"),
                             .init(title: "Детские приключенческие книги", image: "bookBackground"),
                             .init(title: "Книги для школьников", image: "bookBackground"),
                             .init(title: "Школьные учебники", image: "bookBackground"),
                             .init(title: "Детские детективы", image: "bookBackground"),
                             .init(title: "Книги для подростков", image: "bookBackground")
                            ])
    }()
    
    var pageData: [ListSection] {
        [artisticLiterature]
    }
}

