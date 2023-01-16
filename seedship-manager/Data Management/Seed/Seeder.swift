//
//  Seeder.swift
//  seedship-manager
//
//  Created by Alex Viney on 20/12/2022.
//

import SwiftUI
import CoreData

func getSeedBankSeeds(moc: NSManagedObjectContext) -> [ResourceQuantity] {
    var resources: [ResourceQuantity] = []
    
    let seeds = [
        (resource: Resources.SeedLettuce.getModel(), count: Int16(5000))
    ]
    for seed in seeds {
        let resourceQuantity = ResourceQuantity(context: moc)
        resourceQuantity.count = seed.count
        resourceQuantity.resource = seed.resource
        resources.append(resourceQuantity)
    }
    
    return resources
}

func seed(moc: NSManagedObjectContext) {
    for fac in Facilities.allCases {
        let facilityControls = FacilityControls(context: moc)
        facilityControls.lifeSupportOn = true
        
        let facility = Facility(context: moc)
        facility.name = fac.rawValue
        facility.id =  UUID()
        facility.controls = facilityControls
    }
    
    for blueprint in Assets.allCases {
        let assetBlueprint = AssetBlueprint(context: moc)
        assetBlueprint.name = blueprint.name
        assetBlueprint.weight = blueprint.weight
        assetBlueprint.details = blueprint.details
        assetBlueprint.code = blueprint.code
    }
    
    let assetsToSeed = [
        (asset: Assets.SeedBank, facility: Facilities.BioFarm, resources: getSeedBankSeeds(moc: moc))
    ]
    for assetSeed in assetsToSeed {
        let asset = Asset(context: moc)
        asset.facility = assetSeed.facility.getModel()
        asset.blueprint = assetSeed.asset.getModel()
        for resource in assetSeed.resources {
            asset.addToResources(resource)
        }
    }
    
    for name in ["Nero Ren", "Alex Sol", "Vera Teller"] {
        let member = CrewMember(context: moc)
        member.name = name
        member.age = 43
        member.weight = 88
        member.id =  UUID()
        member.facility = Facilities.CryoChamber.getModel()
    }
}
