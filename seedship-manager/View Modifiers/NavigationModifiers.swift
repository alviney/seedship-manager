//
//  NavigationModifiers.swift
//  seedship-manager
//
//  Created by Alex Viney on 21/12/2022.
//

import SwiftUI

struct Nav: ViewModifier {
    @State var title: String  = "Title"
    @State var navTitle: String? = nil
    @State var showingSheet: Bool = false
    
    func body(content: Content) -> some View {
        content
            .navigationTitle(navTitle ?? title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text(title)
                            .modifier(AppText(type: TextType.largeTitle))
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("")
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        self.showingSheet.toggle()
                    } label: {
                        Icon(name: "book.closed", size: 20)
                    }
                    .sheet(isPresented: $showingSheet) {
                        ManualView()
                    }
                 }
            }
    }
}
