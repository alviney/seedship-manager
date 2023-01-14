//
//  CommandController.swift
//  seedship-manager
//
//  Created by Alex Viney on 13/1/2023.
//

import Foundation
import CoreData

struct Commander : GameLoop {
    public func update() {
        let members = getMembers()
        
        for member in members {
            if let command = member.currentCommand {
                FacilityCommand(string: command.name!).execute(command: command)
                if command.progress == 1 {
                    PersistenceController.shared.viewContext.delete(command)
                }
            }
        }
    }
    
    private func getMembers() -> [CrewMember] {
        var members: [CrewMember] = []
        
        let fetchRequest = NSFetchRequest<CrewMember>(entityName: "CrewMember")
//        fetchRequest.predicate = NSPredicate(format: "awake == true")
        do {
            members = (try PersistenceController.shared.viewContext.fetch(fetchRequest))
        } catch {}
        
        return members
    }
}
