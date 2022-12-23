//
//  Seeder.swift
//  seedship-manager
//
//  Created by Alex Viney on 20/12/2022.
//

import SwiftUI
import CoreData

func seedCrewMembers(moc: NSManagedObjectContext) {
    let names = ["Nero Ren", "Alex Sol", "Vera Teller"]
    for name in names {
        seedCrewMember(moc: moc, name: name)
    }
}

@discardableResult func seedCrewMember(moc: NSManagedObjectContext, name: String) -> CrewMember {
    let member = CrewMember(context: moc)
    member.name = name
    member.age = 43
    member.weight = 88
    member.id =  UUID()
    
    return member
}

func seedFacilities(moc: NSManagedObjectContext) {
    let names = ["Crew Quarters", "Medical Bay", "Bio Farm", "Engine Room", "Cargo Hold", "3D Printer", "Hull", "Holodeck", "Life Support", "Cryo Chamber"]
    
    for name in names {
        let facility = Facility(context: moc)
        facility.name = name
        facility.id =  UUID()
    }
}
