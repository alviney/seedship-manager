//
//  Constants.swift
//  seedship-manager
//
//  Created by Alex Viney on 17/12/2022.
//

import Foundation

enum CustomFont: String {
    case Technical = "Aldrich"
}

enum CustomColor: String {
    case ActiveAccent = "ColorActiveAccent"
    
    case DefaultBackground = "ColorDefaultBackground"
    case CardBackground = "ColorCardBackground"
    case CardContentBackground = "ColorCardContentBackground"
    case SubheaderBackground = "ColorSubheaderBackground"
    case TabViewBackground = "ColorTabViewBackground"
    case ManualViewBackground = "ColorManualBackground"
    
    case TitleFont = "ColorTitleFont"
    case TitleAltFont = "ColorTitleAltFont";
    case BodyFont = "ColorBodyFont"
    
    case BorderDefault = "ColorBorderDefault"
    case BorderSecondary = "ColorBorderSecondary"
}

enum CustomImage: String {
    case HomeHero = "ImageSpaceship01"
    case BioFarm = "ImageBioFarm"
    case CryoChamber = "ImageCryoDoor"
    case EngineRoom = "ImageEngineRoom"
}
