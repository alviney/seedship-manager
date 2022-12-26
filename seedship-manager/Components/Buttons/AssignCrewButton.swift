//
//  AssignCrewButton.swift
//  seedship-manager
//
//  Created by Alex Viney on 26/12/2022.
//

import SwiftUI

struct AssignCrewButton: View {
    @State var showingSheet = false
    
    var body: some View {
        Button {
            self.showingSheet.toggle()
        } label: {
            Text("Assign Crew Member")
                .modifier(AppText(type: TextType.smallBody))
        }
        .sheet(isPresented: $showingSheet) {
            CrewSelectorView()
        }
    }
}

struct AssignCrewButton_Previews: PreviewProvider {
    static var previews: some View {
        AssignCrewButton()
    }
}
