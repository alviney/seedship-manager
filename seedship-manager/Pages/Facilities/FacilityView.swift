//
//  RoomView.swift
//  seedship-manager
//
//  Created by Alex Viney on 23/12/2022.
//

import SwiftUI

struct FacilityView: View {
    @State var facility: Facility
    @State private var controls: FacilityControls
    @State private var navIndex = 0
    @State private var lifeSupportIsOn = false
    @State private var image: Image?
    
    
    init(facility: Facility, image: String = "") {
        self.facility = facility
        self.controls = facility.controls!
        self.image = Image(image)
        
        UISegmentedControl.appearance()
            .setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Aldrich", size: 14.0)!], for: .normal)
    }
    
    var body: some View {
        ZStack {
            Color(CustomColor.DefaultBackground.rawValue).ignoresSafeArea()
            
            VStack (spacing: 20) {
                HStack {
                    Text(facility.name ?? "Room")
                        .modifier(AppText(type: TextType.mediumTitle))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Picker("", selection: $navIndex) {
                    Text("Overview").tag(0)
                    Text("Tasks").tag(1)
                    Text("Assets").tag(2)
                    Text("Inventory").tag(3)
                }
                .pickerStyle(.segmented)
                
                TabView(selection: $navIndex,
                        content:  {
                    OverviewView(facility: facility).tag(0) 
                    TasksView(title: "Tasks").tag(1)
                    TasksView(title: "Assets").tag(2)
                    TasksView(title: "Inventory").tag(3)
                })
                .padding(1)            
                .tabViewStyle(PageTabViewStyle())
            }
            .padding(24)
        }
        .modifier(Nav(title: "Facility"))
    }
}

struct FacilityView_Previews: PreviewProvider {
    static var previews: some View {
        let facility = seedFacility(moc: PersistenceController.preview.container.viewContext, name: "Facility")
        FacilityView(facility: facility)
        
    }
}
