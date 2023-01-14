//
//  Commands.swift
//  seedship-manager
//
//  Created by Alex Viney on 13/1/2023.
//

import Foundation

protocol CommandProtocol {
    func execute(command: Command)
}

enum FacilityCommand : CommandProtocol {
    case Assign
    case UnAssign
    case Wake
    
    init(string: String) {
        switch string {
        case "Assign":
            self = .Assign
        case "UnAssign":
            self = .UnAssign
        case "Wake":
            self = .Wake
        default:
            self = .Assign
        }
    }
    
    func execute(command: Command) {
        switch self {
        case .Assign:
            Executor.Assign.execute(command: command)
        case .UnAssign:
            Executor.Unassign.execute(command: command)
        case .Wake:
            Executor.Wake.execute(command: command)
        }
    }
    
    func createFor(member: CrewMember, facility: Facility) {
        let moc = PersistenceController.shared.viewContext
        
        let command = Command(context: moc)
        command.progress = 0
        command.running = false
        command.name = "\(self)"
        command.facility = facility
        
        if member.commandQueue == nil {
            let q = CommandQueue(context: moc)
            q.member = member
        }
        let queue = member.commandQueue
        queue?.addToCommands(command)
        
        PersistenceController.shared.save()
    }
}
