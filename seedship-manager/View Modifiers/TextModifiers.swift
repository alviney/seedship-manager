//
//  TextModifiers.swift
//  seedship-manager
//
//  Created by Alex Viney on 17/12/2022.
//

import Foundation
import SwiftUI

enum TextType {
    enum Colour {
        case Default
        case Danger
    }
    
    case largeTitle(Colour = Colour.Default)
    case mediumTitle(Colour = Colour.Default)
    case smallTitle(Colour = Colour.Default)
    
    case largeTitleAlt(Colour = Colour.Default)
    case mediumTitleAlt(Colour = Colour.Default)
    case smallTitleAlt(Colour = Colour.Default)
    
    case smallBody(Colour = Colour.Default)
    case extraSmallBody(Colour = Colour.Default)
    
    case smallBodyAlt(Colour = Colour.Default)
    case extraSmallBodyAlt(Colour = Colour.Default)
    
    func getFont() -> Font? {
        return Font.custom(CustomFont.Technical.rawValue, size: size)
    }
    
    var size: CGFloat {
        switch self {
        case .largeTitle, .largeTitleAlt: return 24
        case .mediumTitle, .mediumTitleAlt: return 20
        case .smallTitle, .smallTitleAlt: return 16
        case .smallBody, .smallBodyAlt: return 16
        case .extraSmallBody, .extraSmallBodyAlt: return 10
        }
    }
    
    func getColor() -> Color {
        var color: Color = CustomColor.TitleFont.color
        
        
        switch self {
        case let .largeTitle(c), let .mediumTitle(c), let .smallTitle(c), let .smallBody(c), let .extraSmallBody(c):
            switch c {
            case .Danger:
                color = CustomColor.Danger.color
            default:
                color = CustomColor.TitleFont.color
            }
        default:
            color = CustomColor.TitleAltFont.color
        }
        
        return color
    }
    
    func getCase() -> Text.Case? {
        switch self {
        case .largeTitle, .largeTitleAlt, .mediumTitle, .mediumTitleAlt, .smallTitle, .smallTitleAlt:
            return .uppercase
        default:
            return nil
        }
    }
}

struct AppText: ViewModifier {
    @State var type: TextType = TextType.smallBody()
    
    func body(content: Content) -> some View {
        content
            .font(type.getFont())
            .textCase(type.getCase())
            .foregroundColor(type.getColor())
    }
}
