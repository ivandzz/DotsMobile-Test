//
//  Persistence.swift
//  DotsMobile-Test
//
//  Created by Іван Джулинський on 08.11.2025.
//

import CoreData

struct PersistenceController {
    
    static let shared = PersistenceController()

    let container: NSPersistentContainer
    
    var context: NSManagedObjectContext {
        container.viewContext
    }

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "DotsMobile_Test")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    func addFavorite(with id: Int) {
        let request = FavoriteProduct.fetchRequest()
        request.predicate = NSPredicate(format: "id == %d", id)
        
        if let exists = try? context.fetch(request), exists.first != nil { return }
        
        let fav = FavoriteProduct(context: context)
        fav.id = Int64(id)
        save()
    }
    
    func removeFavorite(with id: Int) {
        let request = FavoriteProduct.fetchRequest()
        request.predicate = NSPredicate(format: "id == %d", id)

        if let found = try? context.fetch(request).first {
            context.delete(found)
            save()
        }
    }
    
    func isFavorite(with id: Int) -> Bool {
        let request = FavoriteProduct.fetchRequest()
        request.fetchLimit = 1
        request.predicate = NSPredicate(format: "id == %d", id)
        return ((try? context.fetch(request).first) != nil)
    }
    
    func fetchFavorites() -> [Int] {
        let request = FavoriteProduct.fetchRequest()
        let result = (try? context.fetch(request)) ?? []
        return result.compactMap { Int($0.id) }
    }
    
    private func save() {
        if context.hasChanges {
            try? context.save()
        }
    }
}
