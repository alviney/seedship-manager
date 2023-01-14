//
//  Facility+CoreDataProperties.swift
//  seedship-manager
//
//  Created by Alex Viney on 24/12/2022.
//
//

import Foundation
import CoreData


extension Facility {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Facility> {
        return NSFetchRequest<Facility>(entityName: "Facility")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var controls: FacilityControls?
    @NSManaged public var members: NSSet?
    @NSManaged public var commands: NSSet?

}

// MARK: Generated accessors for members
extension Facility {

    @objc(addMembersObject:)
    @NSManaged public func addToMembers(_ value: CrewMember)

    @objc(removeMembersObject:)
    @NSManaged public func removeFromMembers(_ value: CrewMember)

    @objc(addMembers:)
    @NSManaged public func addToMembers(_ values: NSSet)

    @objc(removeMembers:)
    @NSManaged public func removeFromMembers(_ values: NSSet)

}

extension Facility : Identifiable {

}
