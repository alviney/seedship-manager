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
    @ViewBuilder var destination: Destination
    
    var body: some View {
        NavigationLink {
            destination
        } label: {
            Text(title)
                .frame(maxWidth: .infinity)
                .modifier(Title())
                .modifier(BorderBlock())
                .padding(12)
        }
    }
}
