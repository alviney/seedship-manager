//
//  AssetsView.swift
//  seedship-manager
//
//  Created by Alex Viney on 16/1/2023.
//

import SwiftUI

struct AssetsView: View {
    @FetchRequest(sortDescriptors: []) var commands: FetchedResults<Command>
    
    var body: some View {
        VStack {
            ForEach (commands) { command in
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(command.name ?? "Command")
                    }
                    Spacer()
                    Image(systemName: "person")
                        .font(.largeTitle)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .modifier(Border(borderColor: BorderColor.secondary))
            }
            Spacer()
        }
        .font(Font.custom("Aldrich", size: 12))
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
    }
    
    struct AssetsView_Previews: PreviewProvider {
        static var previews: some View {
            let context = PersistenceController.preview.container.viewContext
            TasksView().environment(\.managedObjectContext, context)
        }
    }
}

