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
        if (members.count == 0) {
            seedCrewMembers(moc: moc)
        }
    }
    
    var body: some View {
        HomeView()
            .onAppear(perform: loadData)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {        
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
