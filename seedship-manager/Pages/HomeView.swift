//
//  Home.swift
//  seedship-manager
//
//  Created by Alex Viney on 19/12/2022.
//

import SwiftUI

struct HomeView: View {
    @State private var selection = 1
    @State private var navIndex = 0
    @State private var isDisclosed = true
    
    init() {
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.init(name: "Aldrich", size: 16)! ], for: .normal)
        
        UIBarButtonItem.appearance()
             .setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Aldrich", size: 14.0)!], for: .normal)

//        UITabBar.appearance().backgroundColor = UIColor(Color(CustomColor.TabViewBackground.rawValue))
    }
    
    var body: some View {
        ZStack {
            Color(CustomColor.DefaultBackground.rawValue).ignoresSafeArea()
            
            VStack (spacing: 0){
                HubView(isDisclosed: $isDisclosed)
                
                HorizontalDivider()
                
                TabView(selection: $selection) {
                    CrewDatabaseView()
                        .tabItem {
                            Text("Crew").modifier(AppText(type: TextType.smallTitle()))
                            Icon(name: "person.3.fill")
                        }
                        .tag(0)
    //                HubView()
    //                    .tabItem {
    //                        Text("Hub").modifier(AppText(type: TextType.smallTitle))
    //                        Icon(name: "tv.inset.filled")
    //                    }
    //                    .tag(1)
                    FacilitiesView()
                        .tabItem {
                            Text("Rooms").modifier(AppText(type: TextType.smallTitle()))
                            Icon(name: "door.left.hand.open", size: 8)
                        }
                        .tag(1)
                }
                .tint(Color.white)
//                .background(Image(CustomImage.HomeHero.rawValue))
            }
        }
    }
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
}
