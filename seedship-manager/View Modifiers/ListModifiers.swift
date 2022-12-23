//
//  ListModifiers.swift
//  seedship-manager
//
//  Created by Alex Viney on 21/12/2022.
//

import SwiftUI

struct ListItemPlain: ViewModifier {
    func body(content: Content) -> some View {
        content
            .listRowSeparator(.hidden)
            .listRowInsets(.init(top: 10, leading: 0, bottom: 0, trailing: 0))
            .buttonStyle(.plain)
    }
}

struct ListPlain: ViewModifier {
    func body(content: Content) -> some View {
        content
            .listStyle(.plain)
            .listRowSeparator(.hidden)
    }
}

