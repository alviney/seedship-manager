//
//  Executor.swift
//  seedship-manager
//
//  Created by Alex Viney on 13/1/2023.
//

import Foundation

enum Executor {
    case Assign
    case Unassign
    case Wake
    
    func execute(command: Command) {
        // run start
        if command.progress == 0 {
            command.running = true
            command.status = "Running"
        }
                
        // apply progress
        // apply custom modifiers here. e.g. CrewMember skill and equipment condition affect
        let tickRate = Float(0.1)
        command.progress += tickRate
        command.progress = min(command.progress, 1)
        
        // apply custom logic
        switch self {
        case .Assign:
            AssignExecutor(command: command)
        case .Unassign:
            AssignExecutor(command: command)
        case .Wake:
            WakeExecutor(command: command)
        }
    }
}

func AssignExecutor(command: Command) {
    
}

func WakeExecutor(command: Command) {
    
}
