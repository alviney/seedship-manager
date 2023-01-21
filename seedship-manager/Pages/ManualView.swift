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
                Theme.Manual.color.ignoresSafeArea()
                
                VStack {
                    Text("Manual")
                    
                    VStack {
                        Spacer()
                    }
                    .modifier(Border())
                    .padding(12)
                }
                .padding(24)
            }
        }
    }
}

struct ManualView_Previews: PreviewProvider {
    static var previews: some View {
        ManualView()
    }
}
