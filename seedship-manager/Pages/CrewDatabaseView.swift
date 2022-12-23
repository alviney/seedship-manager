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
                Color(CustomColor.CardBackground.rawValue).ignoresSafeArea()
                
                VStack(spacing: 20) {
                    VStack {
                        Text("Connection: Live")
                            .modifier(AppText(type: TextType.extraSmallBody))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding([.leading], 16)
                        
                        VStack(spacing: 24) {
                            SubHeaderTechnical(header: "Database")
                                .padding([.top], 16)
                            
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
                            
                            HorizontalDivider()
                            
                            Spacer()
                        }
                        .modifier(ContentBlock())
                        
                        Spacer()
                    }
                }
                .padding([.leading, .trailing, .bottom], 24)
                .padding([.top], 12)
            }
            .modifier(Nav(title: "Crew"))
        }
    }
    
    struct CrewDatabaseView_Previews: PreviewProvider {
        static var previews: some View {
            CrewDatabaseView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}
