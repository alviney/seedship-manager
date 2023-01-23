
//  TextModifiers.swift
//  seedship-manager
//
//  Created by Alex Viney on 17/12/2022.
//

import Foundation
import SwiftUI

struct CFont: ViewModifier {
    @State var textStyle = Font.TextStyle.body
    @State var theme = Theme.Alpha
    public var color: Binding<Color>?
    @State var size: CGFloat?
    
    func body(content: Content) -> some View {
        content
            .font(Font.custom(CustomFont.Technical.rawValue, size: size ?? sizeFromStyle(), relativeTo: textStyle))
            .foregroundColor(color?.wrappedValue ?? theme.text)
    }
    
    func sizeFromStyle() -> CGFloat {
        var style: UIFont.TextStyle
        
        switch textStyle {
          case .largeTitle:  style = .largeTitle
          case .title:       style = .title1
          case .title2:      style = .title2
          case .title3:      style = .title3
          case .headline:    style = .headline
          case .subheadline: style = .subheadline
          case .callout:     style = .callout
          case .caption:     style = .caption1
          case .caption2:    style = .caption2
          case .footnote:    style = .footnote
          case .body: fallthrough
          default: style = .body
       }
        
        return UIFont.preferredFont(forTextStyle: style).pointSize
    }
}

extension View {
    func customFont(textStyle: Font.TextStyle = Font.TextStyle.body, theme: Theme = Theme.Alpha, color: Binding<Color>? = nil, size: CGFloat? = nil) -> some View {
        modifier(CFont(textStyle: textStyle, theme: theme, color: color, size: size))
    }
}
