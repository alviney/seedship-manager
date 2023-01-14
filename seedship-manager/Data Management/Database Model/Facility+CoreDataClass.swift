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
        if let facilityEnum = Facilities(rawValue: self.name!) {
            return facilityEnum.view(facility: self)
        }
        return AnyView(FacilityView(facility: self, image: CustomImage.BioFarm.rawValue))
    }
    
    public func backgroundImage() -> Image {
        Facilities(rawValue: self.name!)?.backgroundImage() ?? Image(CustomImage.BioFarm.rawValue)
    }
}
