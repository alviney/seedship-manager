//
//  Seeder.swift
//  seedship-manager
//
//  Created by Alex Viney on 20/12/2022.
//

import Foundation
import SwiftUI
import CoreData

func seedCrewMembers(moc: NSManagedObjectContext) {
    let names = ["Nero Ren", "Alex Sol", "Vera Teller"]
    for name in names {
        let member = CrewMember(context: moc)
        member.name = name
        member.age = 43
        member.weight = 88
        member.id =  UUID()
    }
}
