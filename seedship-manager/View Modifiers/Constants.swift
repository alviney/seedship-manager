//
//  Constants.swift
//  seedship-manager
//
//  Created by Alex Viney on 17/12/2022.
//

import Foundation
import SwiftUI

enum CustomFont: String {
    case Technical = "Aldrich"
}

enum CustomImage: String {
    case HomeHero = "ImageSpaceship01"
    case BioFarm = "ImageBioFarm"
    case CryoChamber = "ImageCryoDoor"
    case EngineRoom = "ImageEngineRoom"
    case HomeBackground = "ImageStars01"
    case CrewBackground = "CrewBG"
    case CrewBackgroundAwake = "CrewBGAwake"
    
    static func Avatar() -> String {
        return "Crew01"
    }
}
