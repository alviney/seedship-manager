//
//  AssetsView.swift
//  seedship-manager
//
//  Created by Alex Viney on 16/1/2023.
//

import SwiftUI

struct AssetsView: View {
    @State var assets: [Asset]
    
    var body: some View {
        VStack {
            ForEach (assets) { asset in
                PresenterButton {
                    AnyView(Assets(rawValue: asset.blueprint?.name ?? "")?.view(asset: asset))
                } label: {
                    HStack {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(asset.blueprint?.name ?? "Asset")
                        }
                        Spacer()
                        Image(systemName: "archivebox.fill")
                            .font(.largeTitle)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .modifier(Border(borderColor: BorderColor.secondary))
                }
            }
            Spacer()
        }
        .font(Font.custom("Aldrich", size: 12))
        .padding(2)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
    }
    
//    struct AssetsView_Previews: PreviewProvider {
//        static var previews: some View {
//            let context = PersistenceController.preview.container.viewContext
//            AssetsView().environment(\.managedObjectContext, context)
//        }
//    }
}

