//
//  TextModifiers.swift
//  seedship-manager
//
//  Created by Alex Viney on 17/12/2022.
//

import Foundation
import SwiftUI

struct TitleSmall: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom(CustomFont.Technical.rawValue, size: 20))
            .foregroundColor(Color(CustomColor.TitleFont.rawValue))
    }
}

struct TitleModal: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom(CustomFont.Technical.rawValue, size: 20))
            .textCase(.uppercase)
            .foregroundColor(Color(CustomColor.TitleModalFont.rawValue))
    }
}

struct Subheader: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom(CustomFont.Technical.rawValue, size: 16))
            .foregroundColor(Color(CustomColor.TitleFont.rawValue))
    }
}

struct BodySmall: ViewModifier {
    @State var color: Color = Color(CustomColor.BodyFont.rawValue)
    func body(content: Content) -> some View {
        content
            .font(Font.custom(CustomFont.Technical.rawValue, size: 16))
            .foregroundColor(color)
    }
}

struct BodyExtraSmall: ViewModifier {
    @State var color: Color = Color(CustomColor.BodyFont.rawValue)
    func body(content: Content) -> some View {
        content
            .font(Font.custom(CustomFont.Technical.rawValue, size: 10))
            .foregroundColor(color)
    }
}
