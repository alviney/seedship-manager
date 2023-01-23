//
//  MessageService.swift
//  seedship-manager
//
//  Created by Alex Viney on 22/1/2023.
//

import Foundation

struct FeedMessageData {
    let preview: String
    var createdAt: Date = Date()
}

enum FeedMessageAPI: String {
    case General = "general"
    case Task = "task"
    case Warning = "warning"
    case Alert = "alert"
    
    init(string: String) {
        switch string {
        case "general":
            self = .General
        case "task":
            self = .Task
        case "warning":
            self = .Warning
        case "alert":
            self = .Alert
        default:
            self = .General
        }
    }
    
    func persist(data: FeedMessageData) {
        let moc = PersistenceController.shared.viewContext
        
        let message = FeedMessage(context: moc)
        message.type = self.rawValue
        message.createdAt = data.createdAt
        message.preview = data.preview
        
        PersistenceController.shared.save()
    }
}
