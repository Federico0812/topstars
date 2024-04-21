//
//  CoreDataManager.swift
//  TopStars
//
//  Created by Federico Bustos Fierro on 21/04/2024.
//

import CoreData
import Foundation
import UIKit
import Combine

protocol CoreDataDelegate {
    var managedObjectContext: NSManagedObjectContext { get }
    func saveContext()
}

protocol StorageProvider {
    func getStoragePublisher() -> AnyPublisher<[RepoItem], Never>
    func deleteAllEntities()
    func store(items: [RepoItem])
}

class CoreDataManager: CoreDataDelegate, StorageProvider {
    public static let shared = CoreDataManager()
    
    lazy var persistentContainer: NSPersistentContainer! = {
        let persistentContainer = NSPersistentContainer(name: "TopStars",
                                                    managedObjectModel: managedObjectModel)
        persistentContainer.loadPersistentStores(completionHandler: { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return persistentContainer
    }()
    
    lazy var managedObjectModel: NSManagedObjectModel = {
        if let modelURL = Bundle.main.url(forResource: "TopStars", withExtension: "momd"),
           let mom = NSManagedObjectModel(contentsOf: modelURL) {
            return mom
        } else {
            fatalError("Unable to located Core Data model")
        }
    }()
    
    lazy var managedObjectContext: NSManagedObjectContext = {
        let managedObjectContext = persistentContainer.viewContext
        managedObjectContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        return managedObjectContext
    }()

    // MARK: - Core Data - Fetch entities
    
    func fetchAllEntities() throws -> [RepoItem] {
        let context = managedObjectContext
        let request: NSFetchRequest<StoredRepoItem> = StoredRepoItem.fetchRequest()
        request.returnsObjectsAsFaults = false

        do
        {
            let storedItems = try context.fetch(request)
            let repoItems = storedItems.map { $0.repoItem }.sorted { lhs, rhs in
                lhs.name < rhs.name
            }
            return repoItems
        }
        catch
        {
            print ("CoreData: Error Reading Data for single item: \(error.localizedDescription)")
            throw error
        }
    }
    
    func getStoragePublisher() -> AnyPublisher<[RepoItem], Never> {
        guard let cachedData = try? fetchAllEntities(), cachedData.count > 0 else {
            return Empty<[RepoItem], Never>().eraseToAnyPublisher()
        }
        return Just(cachedData).eraseToAnyPublisher()
    }

    // MARK: - Core Data - Store entities
    
    func store(items: [RepoItem]) {
        items.forEach {
            createNewStoreEntity(item: $0)
        }
        saveContext()
    }
    
    func createNewStoreEntity(item: RepoItem) {
        let repoItemData = NSEntityDescription.insertNewObject(forEntityName: "StoredRepoItem", into: managedObjectContext)
        repoItemData.setValue(item.name, forKey: "name")
        repoItemData.setValue(item.fullName, forKey: "fullName")
        repoItemData.setValue(item.id, forKey: "id")
        repoItemData.setValue(item.description, forKey: "repoDescription")
        repoItemData.setValue(item.language, forKey: "language")
        repoItemData.setValue(item.forks, forKey: "forks")
        repoItemData.setValue(item.url, forKey: "url")
        repoItemData.setValue(item.owner.avatarUrl, forKey: "avatarUrl")
    }
    
    func saveContext() {
        managedObjectContext.perform {
            if self.managedObjectContext.hasChanges {
                do {
                    try self.managedObjectContext.save()
                    print ("CoreData: Items Saved!")
                } catch {
                    print ("Error Saving Data: \(error.localizedDescription)")
                }
            }
        }
    }
    
    // MARK: - Core Data - Delete entities
    
    func deleteAllEntities() {
        let entities = managedObjectModel.entities
        for entity in entities {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity.name!)
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
            do {
                try managedObjectContext.execute(deleteRequest)
            } catch {
                print ("CoreData: Failed to delete all entries \(error.localizedDescription)")
            }
        }
    }
    
}
