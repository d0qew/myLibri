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
        .artisticLiterature([.init(title: "Фэнтези", image: UIImage(named: "Fantasy")),
                             .init(title: "Детективы", image: UIImage(named: "Detectives")),
                             .init(title: "Эротика", image: UIImage(named: "Erotica")),
                             .init(title: "Ужасы", image: UIImage(named: "Horrors")),
                             .init(title: "Приключения", image: UIImage(named: "Adventures")),
                             .init(title: "Поэзия", image: UIImage(named: "Poetry")),
                             .init(title: "Фантастика", image: UIImage(named: "Fantastic")),
                             .init(title: "Любовные романы", image: UIImage(named: "RomanceNovels")),
                             .init(title: "Триллеры", image: UIImage(named: "Thrillers")),
                             .init(title: "Комиксы и манга", image: UIImage(named: "ComicsAndManga")),
                             .init(title: "Проза", image: UIImage(named: "Prose"))])
    }()
    
    private let nonFiction: ListSection = {
        .nonFiction([.init(title: "Бизнес-литература", image: UIImage(named: "BusinessLiterature")),
                     .init(title: "Психология", image: UIImage(named: "Psychology")),
                     .init(title: "Искусство и культура", image: UIImage(named: "ArtAndCulture")),
                     .init(title: "Научная литература", image: UIImage(named: "ScientificLiterature")),
                     .init(title: "Хобби и досуг", image: UIImage(named: "HobbiesAndLeisure")),
                     .init(title: "Изучение языков", image: UIImage(named: "LearningLanguages")),
                     .init(title: "Компьютерная литература", image: UIImage(named: "ComputerLiterature")),
                     .init(title: "История", image: UIImage(named: "History")),
                     .init(title: "Общество", image: UIImage(named: "Society")),
                     .init(title: "Мемуары", image: UIImage(named: "Memoirs")),
                     .init(title: "Красота и здоровье", image: UIImage(named: "BeautyAndHealth"))])
    }()
        
    private let childrenLiterature: ListSection = {
        .childrenLiterature([.init(title: "Книги для дошкольников", image: UIImage(named: "BooksForPreschoolers")),
                             .init(title: "Внеклассное чтение", image: UIImage(named: "ExtracurricularReading")),
                             .init(title: "Детские приключения", image: UIImage(named: "ChildrensAdventureBooks")),
                             .init(title: "Книги для школьников", image: UIImage(named: "BooksForSchoolchildren")),
                             .init(title: "Школьные учебники", image: UIImage(named: "SchoolTextbooks")),
                             .init(title: "Детские детективы", image: UIImage(named: "ChildrensDetectives")),
                             .init(title: "Книги для подростков", image: UIImage(named: "BooksForTeenagers"))
                            ])
    }()
    
    var pageData: [ListSection] {
        [artisticLiterature, nonFiction, childrenLiterature]
    }
}

