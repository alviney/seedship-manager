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
