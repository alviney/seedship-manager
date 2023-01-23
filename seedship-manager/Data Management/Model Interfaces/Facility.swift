//
//  Facilities.swift
//  seedship-manager
//
//  Created by Alex Viney on 11/1/2023.
//

import Foundation
import SwiftUI
import CoreData

enum FacilityAPI: String, CaseIterable {
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
    
    public func view() -> AnyView {    
        if let facility = self.getModel() {
            return AnyView(FacilityView(facility: facility))
        }
        
        return AnyView(EmptyView())
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
    
    public func getModel() -> Facility? {
        var response: [Facility] = []
        let fetchRequest = NSFetchRequest<Facility>(entityName: "Facility")
        fetchRequest.predicate = NSPredicate(format: "name == %@", self.rawValue)
        do {
            response = try PersistenceController.shared.viewContext.fetch(fetchRequest)
        } catch {}
        
        return response.first
    }
}
