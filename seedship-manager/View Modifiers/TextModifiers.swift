//
//  TextModifiers.swift
//  seedship-manager
//
//  Created by Alex Viney on 17/12/2022.
//

import Foundation
import SwiftUI

enum TextType {
    case largeTitle
    case mediumTitle
    case smallTitle
    
    case largeTitleAlt
    case mediumTitleAlt
    case smallTitleAlt
    
    case smallBody
    case extraSmallBody
    
    case smallBodyAlt
    case extraSmallBodyAlt
    
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
        var color: String = CustomColor.TitleFont.rawValue
        
        switch self {
        case .largeTitle, .mediumTitle, .smallTitle, .smallBody, .extraSmallBody:
            color = CustomColor.TitleFont.rawValue
        default:
            color = CustomColor.TitleAltFont.rawValue
        }
        
        return Color(color)
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
    @State var type: TextType = TextType.smallBody
    
    func body(content: Content) -> some View {
        content
            .font(type.getFont())
            .textCase(type.getCase())
            .foregroundColor(type.getColor())
    }
}
