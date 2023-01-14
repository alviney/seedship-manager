//
//  Command+CoreDataProperties.swift
//  seedship-manager
//
//  Created by Alex Viney on 14/1/2023.
//
//

import Foundation
import CoreData


extension Command {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Command> {
        return NSFetchRequest<Command>(entityName: "Command")
    }

    @NSManaged public var progress: Float
    @NSManaged public var running: Bool
    @NSManaged public var status: String?
    @NSManaged public var name: String?
    @NSManaged public var facility: Facility?
    @NSManaged public var queue: CommandQueue?

}

extension Command : Identifiable {

}
