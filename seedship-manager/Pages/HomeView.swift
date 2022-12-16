//
//  Home.swift
//  seedship-manager
//
//  Created by Alex Viney on 17/12/2022.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        ZStack {
            Color("CardBackgroundColor").ignoresSafeArea()
            VStack {
                Text("Home")
                    .font(Font.custom("Aldrich", size: 20))
            }
            .foregroundColor(Color.white)
        }
    }
    
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
}

