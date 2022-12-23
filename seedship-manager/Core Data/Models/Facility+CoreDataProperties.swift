//
//  Facility+CoreDataProperties.swift
//  seedship-manager
//
//  Created by Alex Viney on 21/12/2022.
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

}

extension Facility : Identifiable {

}
