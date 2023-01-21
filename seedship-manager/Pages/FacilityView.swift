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
    
    
    init(facility: Facility) {
        self.facility = facility
        self.controls = facility.controls!
        
        UISegmentedControl.appearance()
            .setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: CustomFont.Technical.rawValue, size: 14.0)!], for: .normal)
    }
    
    var body: some View {
        ZStack {
//            CustomColor.BackgroundFacility.color.ignoresSafeArea()
            
            VStack (spacing: 20) {
                VStack {
                    ToggleView(title: "Life Support", isOn: Binding(projectedValue: $controls.lifeSupportOn))
                    HorizontalDivider(color: Color.white)
                    ToggleView(title: "Power", isOn: Binding(projectedValue: $controls.powerOn))
                    HorizontalDivider(color: Color.white)
                    ToggleView(title: "Water", isOn: Binding(projectedValue: $controls.waterOn))
                }
                .padding(24)
                .background (
                    facility.backgroundImage()
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .opacity(0.4)
                        .allowsHitTesting(false)
                )
                .frame(height: 200)
                .cornerRadius(12)
                .modifier(Border(padding: 0))
                
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
                    AssetsView(assets: facility.assetsArray).tag(2)
                    TasksView(title: "Inventory").tag(3)
                })
                .padding(1)            
                .tabViewStyle(PageTabViewStyle())
            }
        }
        .modifier(Nav(title: facility.name ?? "Facility"))
//        .padding(12)
    }
}

//struct FacilityView_Previews: PreviewProvider {
//    static var previews: some View {
//        FacilityView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}
