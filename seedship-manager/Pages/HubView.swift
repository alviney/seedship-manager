//
//  HubView.swift
//  seedship-manager
//
//  Created by Alex Viney on 22/12/2022.
//

import SwiftUI

struct HubView: View {
    @State var showingSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(CustomColor.DefaultBackground.rawValue).ignoresSafeArea()
                
                VStack (spacing: 20) {
                    Spacer()
                }
                .padding(24)
                .background(Image(CustomImage.HomeHero.rawValue))
            }
            .modifier(Nav(title: "Seedship", navTitle: "Home"))
        }
    }
}

struct HubView_Previews: PreviewProvider {
    static var previews: some View {
        HubView()
    }
}
