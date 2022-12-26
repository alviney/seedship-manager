//
//  CrewMember+CoreDataClass.swift
//  seedship-manager
//
//  Created by Alex Viney on 24/12/2022.
//
//

import Foundation
import CoreData

@objc(CrewMember)
public class CrewMember: NSManagedObject {
    public func isReadyForActiveDuty() -> Bool {
        return true
    }
}
