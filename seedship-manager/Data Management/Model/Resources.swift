//
//  Resources.swift
//  seedship-manager
//
//  Created by Alex Viney on 15/1/2023.
//

import Foundation
import CoreData

enum Resources: String, CaseIterable {
    case SeedLettuce = "Seed Lettuce"
    
    init?(id : Int) {
        switch id {
        case 1: self = .SeedLettuce
        default: return nil
        }
    }
    
    var name: String {
        return self.rawValue
    }
    
    var weight: Float {
        switch self {
            case .SeedLettuce:
            return 0.01
        }
    }
    
    var details: String {
        switch self {
            case .SeedLettuce:
            return "Delicious lettuce"
        }
    }
    
    public func getModel() -> Resource? {
        var response: [Resource] = []
        let fetchRequest = NSFetchRequest<Resource>(entityName: "Resource")
        fetchRequest.predicate = NSPredicate(format: "name == %@", self.rawValue)
        do {
            response = try PersistenceController.shared.viewContext.fetch(fetchRequest)
        } catch {}
        
        return response.first
    }
}

