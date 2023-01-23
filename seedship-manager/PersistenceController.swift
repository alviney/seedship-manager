//
//  PersistenceController.swift
//  seedship-manager
//
//  Created by Alex Viney on 16/12/2022.
//

import Foundation
import CoreData

struct PersistenceController  {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    var viewContext: NSManagedObjectContext {
        return container.viewContext
    }
    
    // An initializer to load Core Data, optionally able
    // to use an in-memory store.
    init(inMemory: Bool = false) {
//        PersistenceController.clearDatabase()        
        
        // If you didn't name your model Main you'll need
        // to change this name below.
        container = NSPersistentContainer(name: "db")
        
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func save() {
        let context = container.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Show some error here
            }
        }
    }
    
    public func clearDatabase() {
        guard let url = container.persistentStoreDescriptions.first?.url else { return }
        
        let persistentStoreCoordinator = container.persistentStoreCoordinator

         do {
             try persistentStoreCoordinator.destroyPersistentStore(at:url, ofType: NSSQLiteStoreType, options: nil)
             try persistentStoreCoordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: nil)
         } catch {
             print("Attempted to clear persistent store: " + error.localizedDescription)
         }
    }
    
    // A test configuration for SwiftUI previews
    static var preview: PersistenceController = {
        let controller = PersistenceController(inMemory: true)
    
        seed(moc: controller.container.viewContext)
        
        let command = Command(context: controller.container.viewContext)
        command.running = false
        command.progress = Float(0.5)
        command.name = "\(FacilityCommand.Wake)"
        command.status = "Running"
        do {
            try controller.container.viewContext.save()
        } catch {}
        
                
        return controller
    }()
}
