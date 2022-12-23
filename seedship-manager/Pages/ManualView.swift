//
//  ManualView.swift
//  seedship-manager
//
//  Created by Alex Viney on 22/12/2022.
//

import SwiftUI

struct ManualView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color(CustomColor.ManualViewBackground.rawValue).ignoresSafeArea()
                
                VStack {
                    Text("Manual")
                        .modifier(AppText(type: TextType.largeTitle))
                    Spacer()
                }
                .padding(12)
            }
        }
    }
}

struct ManualView_Previews: PreviewProvider {
    static var previews: some View {
        ManualView()
    }
}
