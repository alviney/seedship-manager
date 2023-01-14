//
//  Seeder.swift
//  seedship-manager
//
//  Created by Alex Viney on 20/12/2022.
//

import SwiftUI
import CoreData

@discardableResult  func seedCrewMembers(moc: NSManagedObjectContext) -> [CrewMember] {
    let names = ["Nero Ren", "Alex Sol", "Vera Teller"]
    var members: [CrewMember] = []
    for name in names {
        members.append(seedCrewMember(moc: moc, name: name))
    }
    
    return members
}

@discardableResult func seedCrewMember(moc: NSManagedObjectContext, name: String) -> CrewMember {
    let member = CrewMember(context: moc)
    member.name = name
    member.age = 43
    member.weight = 88
    member.id =  UUID()
    
    return member
}

@discardableResult func seedFacility(moc: NSManagedObjectContext, name: String) -> Facility {
    let facility = Facility(context: moc)
    facility.name = name
    facility.id =  UUID()
    
    let facilityControls = FacilityControls(context: moc)
    facilityControls.lifeSupportOn = true
    
    facility.controls = facilityControls
    
    return facility
}

@discardableResult func seedFacilities(moc: NSManagedObjectContext) -> [Facility] {
    var facilities: [Facility] = []
     
    for name in Facilities.allCases {
        let fac = seedFacility(moc: moc, name: name.rawValue)
        facilities.append(fac)
    }
    
    return facilities
}

func seed(moc: NSManagedObjectContext) {
    let members = seedCrewMembers(moc: moc)
    let facilities = seedFacilities(moc: moc)
    let cryoChamber = facilities.first { $0.name == Facilities.CryoChamber.rawValue }
    for member in members {
        member.facility = cryoChamber
    }
}
