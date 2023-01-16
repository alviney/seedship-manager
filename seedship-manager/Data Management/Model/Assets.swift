//
//  AssetBlueprints.swift
//  seedship-manager
//
//  Created by Alex Viney on 15/1/2023.
//

import Foundation
import CoreData

enum Assets: String, CaseIterable {
    case SeedBank = "Seed Bank"
    
    init?(id : Int) {
        switch id {
        case 1: self = .SeedBank
        default: return nil
        }
    }
    
    var name: String {
        return self.rawValue
    }
    
    var weight: Float {
        switch self {
            case .SeedBank:
            return 4.3
        }
    }
    
    var details: String {
        switch self {
            case .SeedBank:
            return "Used to store seeds in"
        }
    }
    
    var code: String {
        switch self {
            case .SeedBank:
            return "v1"
        }
    }
    
    public func getModel() -> AssetBlueprint? {
        var response: [AssetBlueprint] = []
        let fetchRequest = NSFetchRequest<AssetBlueprint>(entityName: "AssetBlueprint")
        fetchRequest.predicate = NSPredicate(format: "name == %@", self.rawValue)
        do {
            response = try PersistenceController.shared.viewContext.fetch(fetchRequest)
        } catch {}
        
        return response.first
    }
}
