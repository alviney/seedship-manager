//
//  BackgroundModifiers.swift
//  seedship-manager
//
//  Created by Alex Viney on 23/1/2023.
//

import SwiftUI

struct PanelBG: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(8)
            .padding([.top, .bottom], 12)
            .background(Theme.Alpha.border.opacity(0.5))
            .cornerRadius(8)
            .modifier(Border(padding: 0))
    }
}

struct ItemBG: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(8)
            .background(.black.opacity(0.5))
            .cornerRadius(8)
            .modifier(Border(padding: 0))
    }
}

struct ImageBG: ViewModifier {
    @State var image: Image
    @State var opacity = 1.0
    @State var blur: CGFloat?
    
    func body(content: Content) -> some View {
        content
            .background(image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black)
                .opacity(opacity)
                .allowsHitTesting(false)
                .if(blur != nil) { view in
                    view.blur(radius: blur!, opaque: false)
                }
            )
    }
}

extension View {
    func panelBG() -> some View {
        modifier(PanelBG())
    }
    
    func itemBG() -> some View {
        modifier(ItemBG())
    }
    
    func imageBG(image: Image, opacity: Double = 1, blur: CGFloat? = nil) -> some View {
        modifier(ImageBG(image: image, opacity: opacity, blur: blur))
    }
}
