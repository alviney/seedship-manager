//
//  Facility+CoreDataProperties.swift
//  seedship-manager
//
//  Created by Alex Viney on 16/1/2023.
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
    @NSManaged public var assets: NSSet?
    @NSManaged public var commands: NSSet?
    @NSManaged public var controls: FacilityControls?
    @NSManaged public var members: NSSet?

}

// MARK: Generated accessors for assets
extension Facility {

    @objc(addAssetsObject:)
    @NSManaged public func addToAssets(_ value: Asset)

    @objc(removeAssetsObject:)
    @NSManaged public func removeFromAssets(_ value: Asset)

    @objc(addAssets:)
    @NSManaged public func addToAssets(_ values: NSSet)

    @objc(removeAssets:)
    @NSManaged public func removeFromAssets(_ values: NSSet)

}

// MARK: Generated accessors for commands
extension Facility {

    @objc(addCommandsObject:)
    @NSManaged public func addToCommands(_ value: Command)

    @objc(removeCommandsObject:)
    @NSManaged public func removeFromCommands(_ value: Command)

    @objc(addCommands:)
    @NSManaged public func addToCommands(_ values: NSSet)

    @objc(removeCommands:)
    @NSManaged public func removeFromCommands(_ values: NSSet)

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
