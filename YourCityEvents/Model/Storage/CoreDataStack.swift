//
//  CoreDataStack.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 12/15/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import UIKit
import CoreData

class CoreDataStack {
    
    init() {
        _ = persistentContainer
    }
    
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "YourCityEvents")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.mergePolicy = NSMergePolicy(merge: .overwriteMergePolicyType)
        return container
    }()
    
    
    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    
    // MARK: - Fetch & Delete
    
    func fetchOne<T: NSManagedObject>(predicate: NSPredicate? = nil) -> T? {
        let fetchRequest: NSFetchRequest<T> = T.fetchRequest() as! NSFetchRequest<T>
        fetchRequest.fetchLimit = 1
        fetchRequest.predicate = predicate
        do {
            let models = try persistentContainer.viewContext.fetch(fetchRequest)
            return models.first
        } catch {
            preconditionFailure("Can't fetch models")
        }
    }
    
    func fetchAll<T: NSManagedObject>(predicate: NSPredicate? = nil) -> [T] {
        let fetchRequest: NSFetchRequest<T> = T.fetchRequest() as! NSFetchRequest<T>
        fetchRequest.predicate = predicate
        do {
            let models = try persistentContainer.viewContext.fetch(fetchRequest)
            return models
        } catch {
            preconditionFailure("Can't fetch models")
        }
    }
    
    func delete<T: NSManagedObject>(model: T) {
        persistentContainer.viewContext.delete(model)
    }
    
}

extension CoreDataStack {
    
    func newUser(userId: String, fullname: String, image: UIImage?) -> UserCached? {
        let user = UserCached(context: persistentContainer.viewContext)
        user.id = userId
        user.name = fullname
        if let image = image {
            user.imageData = image.pngData()
        }
        return user
    }
    
    func getUser(with id: String) -> UserCached? {
        let predicate = NSPredicate(format: "id = %@", id)
        return fetchOne(predicate: predicate)
    }
    
    func addEvent(_ event: EventModel, image: UIImage) -> EventCached? {
        let cachedEvent = EventCached(context: persistentContainer.viewContext)
        cachedEvent.id = event.id
        cachedEvent.image = image.pngData()
        cachedEvent.title = event.title
        cachedEvent.date = event.date
        cachedEvent.desr = event.description
        return nil
    }
}
