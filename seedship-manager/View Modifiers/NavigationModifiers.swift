//
//  NavigationModifiers.swift
//  seedship-manager
//
//  Created by Alex Viney on 21/12/2022.
//

import SwiftUI

struct Nav: ViewModifier {
    @State var title: String
    @State var navTitle: String
    
    init(title: String = "Title", navTitle: String? = nil) {
        self.title = title
        self.navTitle = navTitle ?? title
        
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    func body(content: Content) -> some View {
        content
            .navigationTitle(navTitle)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(title)
                        .modifier(CFont(textStyle: .title2, theme: .Alpha))
                        .offset(y: 3)
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("")
                }
            }            
    }
}
