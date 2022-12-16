//
//  seedship_managerApp.swift
//  seedship-manager
//
//  Created by Alex Viney on 16/12/2022.
//

import SwiftUI

@main
struct seedship_managerApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.viewContext)
        }
    }
}
