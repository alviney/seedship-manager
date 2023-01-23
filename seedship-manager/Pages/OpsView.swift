//
//  Ops.swift
//  seedship-manager
//
//  Created by Alex Viney on 17/1/2023.
//

import SwiftUI

struct OpsView: View {
    @State var navIndex = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Picker("", selection: $navIndex) {
                        Text("Messages").tag(0)
                        Text("Status").tag(1)
                        Text("Navigation").tag(2)
                    }
                    .pickerStyle(.segmented)
                    .tabViewStyle(PageTabViewStyle())
                }
                .padding(12)
                
                TabView(selection: $navIndex,
                        content:  {
                    Text("All systems offline")
                        .tag(0)
                })
                .padding(8)
                .tabViewStyle(PageTabViewStyle())
                .background(Theme.Beta.color.opacity(0.5))
            }
        }
    }
}

struct Ops_Previews: PreviewProvider {
    static var previews: some View {
        OpsView()
    }
}
