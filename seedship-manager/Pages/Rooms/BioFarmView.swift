//
//  BioFarm.swift
//  seedship-manager
//
//  Created by Alex Viney on 21/12/2022.
//

import SwiftUI

struct BioFarmView: View {
    var body: some View {
        ZStack {
            Color(CustomColor.DefaultBackground.rawValue).ignoresSafeArea()
            Text("Bio Farm")
        }
    }
}

struct BioFarmView_Previews: PreviewProvider {
    static var previews: some View {
        BioFarmView()
    }
}
