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
                                                                         
                VStack() {
                    ForEach (facilities) { facility in
                        NavigationButton(title: facility.name!) {
                            FacilityView(facility: facility)
                        }.padding(4)
                    }
                }
                .padding(24)
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
