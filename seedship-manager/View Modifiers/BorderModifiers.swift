//
//  BorderModifiers.swift
//  seedship-manager
//
//  Created by Alex Viney on 22/12/2022.
//

import SwiftUI

enum BorderColor {
    case primary
    case secondary
    
    var color: Color {
        switch self {
        case .primary: return Color(CustomColor.BorderDefault.rawValue)
        case .secondary: return Color(CustomColor.BorderSecondary.rawValue)
        }
    }
}

struct Border: ViewModifier {
    @State var borderColor: BorderColor = BorderColor.primary
    func body(content: Content) -> some View {
        content
            .padding(12)
            .frame(maxWidth: .infinity)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(borderColor.color, lineWidth: 2)
            )
    }
}
