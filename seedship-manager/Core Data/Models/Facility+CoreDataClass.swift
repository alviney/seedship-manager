//
//  Facility+CoreDataClass.swift
//  seedship-manager
//
//  Created by Alex Viney on 21/12/2022.
//
//

import Foundation
import CoreData
import SwiftUI

@objc(Facility)
public class Facility: NSManagedObject {
    
    public func view() -> some View {
        switch self.name {
        case "Bio Farm":
            return AnyView(BioFarmView(facility: self))
        default:
            return AnyView(FacilityView(facility: self))
        }
    }
}
