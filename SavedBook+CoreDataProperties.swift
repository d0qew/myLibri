//
//  SavedBook+CoreDataProperties.swift
//  myLibri
//
//  Created by Daniil Konashenko on 10.05.2023.
//
//

import Foundation
import CoreData


extension SavedBook {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SavedBook> {
        return NSFetchRequest<SavedBook>(entityName: "SavedBook")
    }

    @NSManaged public var title: String?
    @NSManaged public var author: String?
    @NSManaged public var id: Int64
    @NSManaged public var imageData: Data?
    @NSManaged public var bookData: Data?

}

extension SavedBook : Identifiable {

}
