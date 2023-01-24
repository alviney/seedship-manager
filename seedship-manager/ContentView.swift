//
//  ContentView.swift
//  seedship-manager
//
//  Created by Alex Viney on 16/12/2022.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(sortDescriptors: []) var members: FetchedResults<CrewMember>
    
    func loadData() {
//        PersistenceController.shared.clearDatabase()
        if (members.count == 0) {
            seed(moc: moc)
        }
        
        let _ = GameManager()
    }
    
    var body: some View {
        HomeView()
            .onAppear(perform: loadData)
            .modifier(CFont())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {        
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
