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
                Color(CustomColor.DefaultBackground.rawValue).ignoresSafeArea()
                                                                         
                ScrollView() {
                    ForEach (facilities) { facility in
                        NavigationLink {
                            AnyView(facility.view())
                        } label: {
                            HStack {
                                Text(facility.name ?? "Name")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                .modifier(AppText(type: TextType.mediumTitle()))
                                
                                Spacer()
                                
                                Text("Offline")
                                    .modifier(AppText(type: TextType.smallBody(.Danger)))
                            }
                        }
                        .padding(4)
                    }
                }
                .padding([.leading, .trailing], 12)
                .modifier(Nav(title: "Facilities"))
            }
        }.tint(Color.white)
    }
}

struct FacilitiesView_Previews: PreviewProvider {
    static var previews: some View {
        FacilitiesView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
