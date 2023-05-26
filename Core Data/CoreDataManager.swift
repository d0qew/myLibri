//
//  CoreDataManager.swift
//  myLibri
//
//  Created by Daniil Konashenko on 10.05.2023.
//

import UIKit
import CoreData

public final class CoreDataManager{
    public static var instance: CoreDataManager?
    private init() {}
    
    static func shared() -> CoreDataManager {
        if instance == nil {
            instance = CoreDataManager()
        }
        return instance!
    }
    
    // MARK: - CRUD
    func createSavedBook(_ id: Int64, title: String, author: String, imageData: Data, bookData: Data) {
        let context = persistentContainer.viewContext
        guard let savedBookEntityDescription = NSEntityDescription.entity(forEntityName: "SavedBook", in: context) else {
            return
        }
        let savedBook = SavedBook(entity: savedBookEntityDescription, insertInto: context)
        savedBook.id = id
        savedBook.title = title
        savedBook.author = author
        savedBook.imageData = imageData
        savedBook.bookData = bookData
        
        saveContext()
    }
    
    func fetchAllSavedBooks() -> [SavedBook]? {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "SavedBook")
        do {
            return try context.fetch(fetchRequest) as? [SavedBook]
        }catch {
            print(error.localizedDescription)
        }
        return nil
    }
    
    func deleteAllSavedBooks() {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "SavedBook")
        do {
            let books = try? context.fetch(fetchRequest) as? [SavedBook]
            books?.forEach { context.delete($0)}
        }
        
        saveContext()
    }
    
    func deleteSavedBook(with id: Int64) {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "SavedBook")
        fetchRequest.predicate = NSPredicate(format: "id == %@", id)
        do {
            guard let books = try? context.fetch(fetchRequest) as? [SavedBook],
                  let book = books.first else {return}
            context.delete(book)
        }
        saveContext()
    }
    
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "SavedBook")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
        return container
    }()
    
    // MARK: - Core Data Saving support
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                context.rollback()
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}
