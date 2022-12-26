//
//  CrewSelectorView.swift
//  seedship-manager
//
//  Created by Alex Viney on 26/12/2022.
//

import SwiftUI

struct CrewSelectorView: View {
    @FetchRequest(sortDescriptors: []) var members: FetchedResults<CrewMember>
    @State private var selectedMember: CrewMember? = nil
    
    var body: some View {
        ZStack {
            Color(CustomColor.DefaultBackground.rawValue).ignoresSafeArea()
            
            VStack {
                List (members) { member in
                    Button {
                        self.selectedMember = member
                    } label: {
                        CrewMemberItem(member: member)
                    }
                    .modifier(ListItemPlain())
                }
                .sheet(item: $selectedMember) { member in
                    CrewMemberView(member: member)
                }
                .modifier(ListPlain())
            }
            .padding(12)
        }
    }
}

struct CrewSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        CrewSelectorView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
