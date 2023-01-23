//
//  MainTabBar.swift
//  seedship-manager
//
//  Created by Alex Viney on 23/1/2023.
//

import SwiftUI

struct MainTabBar: View {
    @Binding var selection: Int
    @Binding var onChange: Bool
    
    var body: some View {
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
                    onChange = index ==  1
                }
            })
        }
    }
}

struct MainTabBar_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBar(selection: .constant(1), onChange: .constant(true))
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
