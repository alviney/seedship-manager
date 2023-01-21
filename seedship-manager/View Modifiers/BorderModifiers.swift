//
//  BorderModifiers.swift
//  seedship-manager
//
//  Created by Alex Viney on 22/12/2022.
//

import SwiftUI

struct Border: ViewModifier {
    @State var theme: Theme = Theme.Alpha
    @State var padding: CGFloat = 12
    
    func body(content: Content) -> some View {
        content
            .padding(padding)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(theme.border, lineWidth: 2)
            )
    }
}
