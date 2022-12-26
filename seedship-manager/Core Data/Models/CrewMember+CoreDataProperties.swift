//
//  CrewMember+CoreDataProperties.swift
//  seedship-manager
//
//  Created by Alex Viney on 24/12/2022.
//
//

import Foundation
import CoreData


extension CrewMember {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CrewMember> {
        return NSFetchRequest<CrewMember>(entityName: "CrewMember")
    }

    @NSManaged public var age: Int16
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var weight: Int16
    @NSManaged public var room: Facility?

}

extension CrewMember : Identifiable {

}
