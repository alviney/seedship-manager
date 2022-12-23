//
//  NavigationButton.swift
//  seedship-manager
//
//  Created by Alex Viney on 20/12/2022.
//

import Foundation
import SwiftUI


struct NavigationButton<Destination: View>: View {
    @State var title: String = "Link"
    @State var color: Color = Color(CustomColor.TitleFont.rawValue)
    @ViewBuilder var destination: Destination
    
    var body: some View {
        NavigationLink {
            destination
        } label: {
            Text(title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .modifier(AppText(type: TextType.mediumTitle))
                .modifier(BorderBlock())
        }
    }
}
