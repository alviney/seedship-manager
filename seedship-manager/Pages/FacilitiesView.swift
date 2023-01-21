//
//  FacilitiesView.swift
//  seedship-manager
//
//  Created by Alex Viney on 21/12/2022.
//

import SwiftUI

struct FacilitiesView: View {
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) var facilities: FetchedResults<Facility>
    
    var body: some View {
        NavigationStack {
            ZStack {
//                CustomColor.BackgroundFacility.color.ignoresSafeArea()
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 12) {
                        ForEach (facilities) { facility in
                            HStack {
                                HorizontalDivider()
                                Text("Offline")
                                HorizontalDivider()
                            }
                            
                            NavigationLink {
                                AnyView(facility.view())
                            } label: {
                                HStack {
                                    Text(facility.name ?? "Name")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    Spacer()
                                    
                                    Text("Offline")
                                        .padding([.trailing], 24)
                                    
                                    Icon(name: "chevron.right", size: 12, theme: Theme.Beta)
                                }
                            }
                            .padding(4)
                            .modifier(Border())
                            .padding(2)
                        }
                    }
                }
            }
            .modifier(Nav(title: "Facilities"))
            .padding(12)
        }
        .foregroundColor(Theme.Beta.text)
        .tint(Theme.Alpha.navigation)
    }
}

struct FacilitiesView_Previews: PreviewProvider {
    static var previews: some View {
        FacilitiesView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
