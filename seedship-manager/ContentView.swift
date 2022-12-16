//
//  ContentView.swift
//  seedship-manager
//
//  Created by Alex Viney on 16/12/2022.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\CrewMember.name),
    ]) var members: FetchedResults<CrewMember>
    
    func loadData() {
        print(members.count)
        for family in UIFont.familyNames {
             print(family)

             for names in UIFont.fontNames(forFamilyName: family){
             print("== \(names)")
             }
        }
        
        if (members.count == 0) {
            for _ in 0..<2 {
                let member = CrewMember(context: managedObjectContext)
                member.name = "Nero Ren"
                member.age = 43
                member.id =  UUID()
            }
        }
    }
    
    var body: some View {
        HomeView()
            .onAppear(perform: loadData)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
