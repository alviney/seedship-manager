//
//  Home.swift
//  seedship-manager
//
//  Created by Alex Viney on 19/12/2022.
//

import SwiftUI

struct HomeView: View {
    @State private var selection = 1
    @State private var isDisclosed = true
    
    init() {
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.init(name: CustomFont.Technical.rawValue, size: 16)! ], for: .normal)
        
        UIBarButtonItem.appearance()
            .setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: CustomFont.Technical.rawValue, size: 14.0)!], for: .normal)
    }
    
    var body: some View {
            ZStack {
                VStack (spacing: 0){
                    FeedHeader()
                    HubView(isDisclosed: $isDisclosed)
                    HorizontalDivider(height: 4)
                    
                    if selection == 0 {
                        CrewDatabaseView()
                    }
                    else if selection == 1 {
                        OpsView()
                    } else {
                        FacilitiesView()
                    }
                    
                    MainTabBar(selection: $selection, onChange: $isDisclosed)
                }
            }
            .imageBG(image: Image(CustomImage.HomeBackground.rawValue))
    }
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
}
