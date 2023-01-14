//
//  AssignCrewButton.swift
//  seedship-manager
//
//  Created by Alex Viney on 26/12/2022.
//

import SwiftUI

struct AssignCrewButton: View {
    @State var facility: Facility
    @State var showingSheet = false
    
    var body: some View {
        Button {
            self.showingSheet.toggle()
        } label: {
            Text("Assign Crew Member")
                .modifier(AppText(type: TextType.smallBody))
        }
        .sheet(isPresented: $showingSheet) {
            let inFacilityPredicate = NSPredicate(format: "facility = %@", facility)
            CrewSelectorView(onSelectMember: self.removeMember, predicate: inFacilityPredicate)
            let predicate = NSPredicate(format: "facility != %@", facility)
            CrewSelectorView(onSelectMember: self.addMember, predicate: predicate)
        }
    }
    
    func addMember(member: CrewMember) {
        FacilityCommand.Assign.createFor(member: member, facility: facility)
    }
    
    func removeMember(member: CrewMember) {
        FacilityCommand.UnAssign.createFor(member: member, facility: facility)        
    }
}
//
//struct AssignCrewButton_Previews: PreviewProvider {
//    static var previews: some View {
//        AssignCrewButton()
//    }
//}
