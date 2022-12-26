//
//  BioFarm.swift
//  seedship-manager
//
//  Created by Alex Viney on 21/12/2022.
//

import SwiftUI

struct BioFarmView: View {
    @State var facility: Facility
    
    var body: some View {
        FacilityView(facility: facility, image: CustomImage.BioFarm.rawValue)
    }
}

struct BioFarmView_Previews: PreviewProvider {
    static var previews: some View {
        let facility = seedFacility(moc: PersistenceController.preview.container.viewContext, name: "Bio Farm")
        BioFarmView(facility: facility)
    }
}
