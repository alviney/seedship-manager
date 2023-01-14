//
//  Facilities.swift
//  seedship-manager
//
//  Created by Alex Viney on 11/1/2023.
//

import Foundation
import SwiftUI

enum Facilities: String, CaseIterable {
    case CryoChamber = "Cryo Chamber"
    case CrewQuarters = "Crew Quarters"
    case MedicalBay = "Medical Bay"
    case BioFarm = "Bio Farm"
    case EngineRoom = "Engine Room"
    case CargoHold = "Cargo Hold"
    case Printer = "3D Printer"
    case Hull = "Hull"
    case Holodeck = "Holedeck"
    case LifeSupport = "Life Support"
    
    init?(id : Int) {
          switch id {
          case 1: self = .CryoChamber
          case 2: self = .CrewQuarters
          case 3: self = .MedicalBay
          case 4: self = .BioFarm
          case 5: self = .EngineRoom
          case 6: self = .CargoHold
          case 7: self = .Printer
          case 8: self = .Hull
          case 9: self = .Holodeck
          case 10: self = .LifeSupport
          default: return nil
          }
      }
    
    public func view(facility: Facility) -> AnyView {
        switch facility.name {
        case Facilities.BioFarm.rawValue:
            return AnyView(BioFarmView(facility: facility))
        case Facilities.CryoChamber.rawValue:
            return AnyView(CryoChamberView(facility: facility))
        case Facilities.EngineRoom.rawValue:
            return AnyView(CryoChamberView(facility: facility))
        default:
            return AnyView(FacilityView(facility: facility, image: CustomImage.BioFarm.rawValue))
        }
    }
    
    public func backgroundImage() -> Image {
        switch self {
        case .BioFarm:
            return Image(CustomImage.BioFarm.rawValue)
        case .CryoChamber:
            return Image(CustomImage.CryoChamber.rawValue)
        case .EngineRoom:
            return Image(CustomImage.EngineRoom.rawValue)
        default:
            return Image(CustomImage.BioFarm.rawValue)
        }
    }
}
