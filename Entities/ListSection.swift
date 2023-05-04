//
//  ListSection.swift
//  myLibri
//
//  Created by Daniil Konashenko on 29.04.2023.
//

import UIKit

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
