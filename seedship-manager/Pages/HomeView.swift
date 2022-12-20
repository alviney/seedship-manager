//
//  Home.swift
//  seedship-manager
//
//  Created by Alex Viney on 19/12/2022.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @State private var showingSheet = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(CustomColor.DefaultBackground.rawValue).ignoresSafeArea()
                
                VStack {
                    HStack {
                        Header(header: "Seed ship manager")
                        Image(systemName: "book.closed")
                            .font(.system(size: 30.0))
                            .foregroundColor(Color(CustomColor.TitleFont.rawValue))
                    }
                    .padding(12)
                    
                    NavigationButton(title: "Facilities") {
                        CrewDatabaseView()
                    }
                    
                    Spacer()
                    
                    NavigationButton(title: "Crew") {
                        CrewDatabaseView()
                    }
                }
                .background(Image(CustomImage.HomeHero.rawValue))
            }
        }
    }
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
}
