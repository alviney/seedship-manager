//
//  VStackModifiers.swift
//  seedship-manager
//
//  Created by Alex Viney on 18/12/2022.
//

import SwiftUI

struct ContentBlock: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(16)
            .background(Color.white)
            .cornerRadius(12)
    }
}

struct BorderBlock: ViewModifier {
    @State var color: Color = Color(CustomColor.BorderDefault.rawValue)
    @State var hasPadding: Bool = true
    func body(content: Content) -> some View {
        content
            .if(hasPadding) { view in
                view.padding(16)
            }
            .frame(maxWidth: .infinity)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(color, lineWidth: 2)
            )            
    }
}

struct HeaderBlock: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(12)
            .background(Color.white)
            .cornerRadius(8)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct SubheaderBlock: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(CustomColor.SubheaderBackground.rawValue))
            .cornerRadius(8)
    }
}

extension View {
    /// Applies the given transform if the given condition evaluates to `true`.
    /// - Parameters:
    ///   - condition: The condition to evaluate.
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
