//
//  CrewDatabase.swift
//  seedship-manager
//
//  Created by Alex Viney on 18/12/2022.
//

import SwiftUI

struct CrewDatabaseView: View {
    @FetchRequest(sortDescriptors: []) var members: FetchedResults<CrewMember>
    @State private var selectedMember: CrewMember? = nil
    
    var body: some View {
        NavigationStack {
            ZStack {
                Spacer()
                VStack(spacing: 20) {
                    VStack {
                        Text("Database: Connected")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding([.leading], 16)
                        
                        VStack(spacing: 24) {
                            List (members) { member in
                                NavigationLink {
                                    CrewMemberView(member: member)
                                } label: {
                                    CrewMemberItem(member: member)
                                    
                                }
                                .modifier(ListItemPlain())
                            }
                            .modifier(ListPlain())
                        }
                        
                        Spacer()
                    }
                }
                .padding([.top], 12)
            }
            .modifier(CFont(textStyle: .footnote, theme: .Beta))
            .modifier(Nav(title: "Crew"))
            .padding(12)
            .imageBG(image: Image(CustomImage.CrewBackground.rawValue), opacity: 0.5, blur: 2)
        }
    }
    
    struct CrewDatabaseView_Previews: PreviewProvider {
        static var previews: some View {
            CrewDatabaseView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}
