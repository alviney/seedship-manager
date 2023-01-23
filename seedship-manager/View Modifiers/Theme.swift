//
//  Theme.swift
//  seedship-manager
//
//  Created by Alex Viney on 20/1/2023.
//

import SwiftUI

enum Theme: String {
    case Alpha = "Alpha"
    case Beta = "Beta"
    case Charlie = "Charlie"
    case Manual = "Manual"
    
    var color: Color {
        return Color(self.rawValue)
    }
    
    var accent: Color {
        return Color("\(self.rawValue)Accent")
    }
    
    var accentActive: Color {
        return Color("\(self.rawValue)AccentActive")
    }
    
    var accentInactive: Color {
        return Color("\(self.rawValue)AccentInactive")
    }
    
    var icon: Color {
        return Color("\(self.rawValue)Icon")
    }
    
    var iconFocus: Color {
        return Color("\(self.rawValue)IconFocus")
    }
    
    var text: Color {
        return Color("\(self.rawValue)Font")
    }
    
    var navigation: Color {
        return Color("AlphaNavigation")
    }
    
    var danger: Color {
        return Color("AlphaDanger")
    }
    
    var border: Color {
        return Color("\(self.rawValue)Border")
    }
    
    static var Health: Color {
        return Color("AppHealth")
    }
    
    static var Occupation: Color {
        return Color("AppOccupation")
    }
    
    static var MessageTask: Color {
        return Color("AppMessageTask")
    }
    
    func opacity(_ val: CGFloat) -> Color {
        return self.color.opacity(val)
    }
}
