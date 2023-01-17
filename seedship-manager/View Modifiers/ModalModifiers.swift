//
//  ModalModifiers.swift
//  seedship-manager
//
//  Created by Alex Viney on 16/1/2023.
//

import SwiftUI

struct Modal: ViewModifier {
    @State var viewToShow: any View
    @Binding var isShowingSheet: Bool
    
    func body(content: Content) -> some View {
        content
            .sheet(isPresented: $isShowingSheet) {
                AnyView(viewToShow)
            }
    }
}
