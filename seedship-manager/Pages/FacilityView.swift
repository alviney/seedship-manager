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
    @State var theme = Theme.Alpha
    
    
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
//                PresenterButton {
//                    AnyView(ManualView())
//                } label: {
//                    Icon(name: "book.closed", size: 20)
//                }                
                Picker("", selection: $navIndex) {
                    Text("Overview").tag(0)
                    Text("Tasks").tag(1)
                    Text("Assets").tag(2)
                    Text("Inventory").tag(3)
                }
                .pickerStyle(.segmented)
                
                TabView(selection: $navIndex,
                        content:  {
                    OverviewView(facility: facility, theme: theme).tag(0) 
                    TasksView(title: "Tasks").tag(1)
                    AssetsView(assets: facility.assetsArray).tag(2)
                    TasksView(title: "Inventory").tag(3)
                })
                .padding(1)            
                .tabViewStyle(PageTabViewStyle())
            }
        }
        .modifier(Nav(title: facility.name ?? "Facility"))
        .padding(12)
        .background (
            facility.backgroundImage()
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity)
                .background(Color.black)
                .opacity(0.4)
                .allowsHitTesting(false)
        )
    }
}

struct FacilityView_Previews: PreviewProvider {
    static var previews: some View {
        FacilityView(facility: createFacility()).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

func createFacility() -> Facility {
    let moc = PersistenceController.preview.viewContext
    let facilityControls = FacilityControls(context: moc)
    
    facilityControls.lifeSupportOn = true
    
    let facility = Facility(context: moc)
    facility.name = Facilities.BioFarm.rawValue
    facility.id =  UUID()
    facility.controls = facilityControls
    
    return facility
}
