//
//  SwiftUIView.swift
//  seedship-manager
//
//  Created by Alex Viney on 24/12/2022.
//

import SwiftUI

struct OverviewView: View {
    @State var facility: Facility
    @State private var controls: FacilityControls
    
    init(facility: Facility) {
        self.facility = facility
        self.controls = facility.controls!
    }
    
    var body: some View {
        VStack {
            VStack {
                ToggleView(title: "Life Support", isOn: Binding(projectedValue: $controls.lifeSupportOn))
                HorizontalDivider(color: Color.white)
                ToggleView(title: "Power", isOn: Binding(projectedValue: $controls.powerOn))
                HorizontalDivider(color: Color.white)
                ToggleView(title: "Water", isOn: Binding(projectedValue: $controls.waterOn))
            }
            .padding(24)
            .background (
                Image(CustomImage.BioFarm.rawValue)
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
            
            HStack {
                Text("Crew: 0")
                    .modifier(AppText(type: TextType.smallBody))
                
                Spacer()
                
                AssignCrewButton()
            }
            .padding([.top], 12)
            
            Spacer()
        }
        .padding(2)
    }
}

struct OverviewView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(CustomColor.DefaultBackground.rawValue).ignoresSafeArea()
            
            let facility = seedFacility(moc: PersistenceController.preview.container.viewContext, name: "Facility")
            OverviewView(facility: facility)
        }
        
    }
}


struct ToggleView: View {
    @State var title: String
    @Binding var isOn: Bool
    
    var body: some View {
        Toggle(isOn: $isOn) {
            Text(title)
                .modifier(AppText(type: TextType.mediumTitle))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(6)
        .tint(Color(CustomColor.ActiveAccent.rawValue))
    }
}
