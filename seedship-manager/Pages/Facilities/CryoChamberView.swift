//
//  CryoChamberView.swift
//  seedship-manager
//
//  Created by Alex Viney on 9/1/2023.
//

import SwiftUI

struct CryoChamberView: View {
    @State var facility: Facility
    
    var body: some View {
        FacilityView(facility: facility, image: CustomImage.CryoChamber.rawValue)
    }
}

struct CryoChamberView_Previews: PreviewProvider {
    static var previews: some View {
        let facility = seedFacility(moc: PersistenceController.preview.container.viewContext, name: "Cryo Chamber")
        CryoChamberView(facility: facility)
    }
}
