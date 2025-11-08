//
//  Persistence.swift
//  DotsMobile-Test
//
//  Created by Іван Джулинський on 08.11.2025.
//

import CoreData

struct PersistenceController {
    
    //MARK: - Properties
    static let shared = PersistenceController()

    let container: NSPersistentContainer
    
    var context: NSManagedObjectContext {
        container.viewContext
    }

    //MARK: Init
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "DotsMobile_Test")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    //MARK: - Public methods
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
    
    //MARK: - Private helper methods
    private func save() {
        if context.hasChanges {
            try? context.save()
        }
    }
}
