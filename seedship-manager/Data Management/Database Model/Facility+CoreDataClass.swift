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
        if let facilityEnum = FacilityAPI(rawValue: self.name!) {
            return facilityEnum.view()
        }
        return AnyView(FacilityView(facility: self))
    }
    
    public var assetsArray: [Asset] {
        let set = assets as? Set<Asset> ?? []
        return Array(set)
    }
    
    public func backgroundImage() -> Image {
        FacilityAPI(rawValue: self.name!)?.backgroundImage() ?? Image(CustomImage.BioFarm.rawValue)
    }
}
