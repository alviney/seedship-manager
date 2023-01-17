//
//  AssetSeedBank.swift
//  seedship-manager
//
//  Created by Alex Viney on 16/1/2023.
//

import SwiftUI

struct AssetSeedBank: View {
    @State var asset: Asset
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Text(asset.blueprint?.name ?? "Asset")
    }
}

//struct AssetSeedBank_Previews: PreviewProvider {
//    static var previews: some View {
//        AssetSeedBank()
//    }
//}
