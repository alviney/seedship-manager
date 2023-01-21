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
        print("init")
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.init(name: CustomFont.Technical.rawValue, size: 16)! ], for: .normal)
        
        UIBarButtonItem.appearance()
            .setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: CustomFont.Technical.rawValue, size: 14.0)!], for: .normal)
    }
    
    var body: some View {
        ZStack {
            Theme.Alpha.color.ignoresSafeArea()
            
            VStack (spacing: 0){
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
                
                VStack {
                    HorizontalDivider(height: 4)
                    HStack  {
                        TabButton(selection: $selection, index: 0, icon: "person.3.fill", title: "Crew")
                        Spacer()
                        TabButton(selection: $selection, index: 1, icon: "tv.inset.filled", title: "Ops")
                        Spacer()
                        TabButton(selection: $selection, index: 2, icon: "door.left.hand.open", title: "Facs")
                    }
                    .padding([.top], 24)
                    .padding([.leading, .trailing], 48)
                    .frame(maxWidth: .infinity)
                    .onChange(of: selection, perform: { index in
                        withAnimation {
                            isDisclosed = index ==  1
                        }
                    })
                }
            }
        }
    }
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
    
    struct TabButton : View {
        @Binding var selection: Int
        public var index: Int
        public var icon: String
        public var title: String?
        @State private var isSelected: Bool = false
        @State var color = Theme.Alpha.icon
        
        var body: some View {
            Button {
                selection = index
            } label: {
                VStack (spacing: 8) {
                    Icon(name: icon, active: $isSelected)
                    if let str = title {
                        Text(str)
                            .modifier(CFont(textStyle: .caption, color: $color))
                            
                    }
                }
            }
            .onAppear(perform: setIconColor)
            .onChange(of: selection, perform: { index in setIconColor() })
        }
        
        func setIconColor() {
            isSelected = index == selection
            color = isSelected ? Theme.Alpha.iconFocus : Theme.Alpha.icon
        }
    }
}
