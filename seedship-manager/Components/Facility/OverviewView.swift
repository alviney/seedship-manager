//
//  SwiftUIView.swift
//  seedship-manager
//
//  Created by Alex Viney on 24/12/2022.
//

import SwiftUI

struct OverviewView: View {
    @StateObject var facility: Facility
    public var theme: Theme
    @State private var controls: FacilityControls
    
    init(facility: Facility, theme: Theme) {
        _facility = StateObject(wrappedValue: facility)
        self.controls = facility.controls!
        self.theme = theme
    }
    
    var body: some View {
            VStack {
                VStack(spacing: 12) {
                    ToggleView(title: "Life Support", isOn: Binding(projectedValue: $controls.lifeSupportOn))
                    HorizontalDivider(height: 1, color: Color.white)
                    ToggleView(title: "Power", isOn: Binding(projectedValue: $controls.powerOn))
                    HorizontalDivider(height: 1, color: Color.white)
                    ToggleView(title: "Water", isOn: Binding(projectedValue: $controls.waterOn))
                }
                .padding(8)
                .padding([.top, .bottom], 12)
                .background(Theme.Alpha.border.opacity(0.5))
                .cornerRadius(8)
                .modifier(Border(padding: 0))
                
                HStack {
                    Text("Crew: \(facility.members?.count ?? 1)")
                    
                    Spacer()
                    
                    AssignCrewButton(facility: self.facility)
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
            Theme.Alpha.color.ignoresSafeArea()
            OverviewView(facility: createFacility(), theme: Theme.Alpha)
        }
        
    }
}


struct ToggleView: View {
    @State var title: String
    @Binding var isOn: Bool
    
    var body: some View {
        Toggle(isOn: $isOn) {
            Text(title)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(height: 10)
        .padding(6)
        .tint(Theme.Alpha.accentActive)
    }
}
