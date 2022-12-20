//
//  CrewDatabase.swift
//  seedship-manager
//
//  Created by Alex Viney on 18/12/2022.
//

import Foundation
import SwiftUI

struct CrewDatabaseView: View {
    @FetchRequest(sortDescriptors: []) var members: FetchedResults<CrewMember>
    @State var showingSheet: Bool = false
    
    var body: some View {
        ZStack {
            Color(CustomColor.CardBackground.rawValue).ignoresSafeArea()
            VStack(spacing: 20) {
                HeaderTechnical(header: "Crew")
                
                VStack {
                    Text("Connection: Live")
                        .modifier(BodyExtraSmall(color: Color.white))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading], 16)
                    
                    VStack(spacing: 24) {
                        SubHeaderTechnical(header: "Database")
                            .padding([.top], 16)
                                                
                        List (members) { member in
                            Button {
                                showingSheet.toggle()
                            } label: {
                                CrewMemberItem(member: member)
//                                    .background( NavigationLink("", destination: ).opacity(0))
                            }
                            .listRowSeparator(.hidden)
                            .listRowInsets(.init(top: 10, leading: 0, bottom: 0, trailing: 0))
                            .buttonStyle(.plain)
                            .sheet(isPresented: $showingSheet) {
                                CrewMemberView(member: member)
                            }
                        }
                        .listStyle(.plain)
                        .listRowSeparator(.hidden)
                        
                        HorizontalDivider()
                        
                        Spacer()
                    }
                    .modifier(ContentBlock())
                    
                    Spacer()
                }
            }
            .padding(24)
        }
    }
    
    struct CrewDatabaseView_Previews: PreviewProvider {
        static var previews: some View {
            CrewDatabaseView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}
