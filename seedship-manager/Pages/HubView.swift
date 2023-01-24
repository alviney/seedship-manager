//
//  HubView.swift
//  seedship-manager
//
//  Created by Alex Viney on 22/12/2022.
//

import SwiftUI

struct HubView: View {
    @Binding var isDisclosed: Bool
    @State var showingSheet: Bool = false
    @State var navIndex = 0
    @State var frameRate = 1.0
    
    var body: some View {
        ZStack {
            VStack {                     
                VStack {
                    if isDisclosed {
                        FeedMessages()
                            .padding(8)
                            .background(Theme.Beta.color.opacity(0.5))
                            .modifier(Border(padding: 0))
                    }
                    
                    HStack {
                        if isDisclosed {
                            Icon(name: "clock")
                            Slider(value: $frameRate, in: 0.1...100)
                            Text("\(frameRate, specifier: "%.2f")")
                        } else {
                            FeedPreview()
                        }
                        
                        Button {
                            withAnimation {
                                isDisclosed.toggle()
                            }
                        } label: {
                            if isDisclosed {
                                Icon(name: "chevron.up")
                            } else {
                                Icon(name: "chevron.down")
                            }
                        }
                        
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(12)
        }
        .frame(height: isDisclosed ? 300 : 50, alignment: .top)
        .clipped()
    }
    
    struct HubView_Previews: PreviewProvider {
        static var previews: some View {
            let moc = PersistenceController.preview.container.viewContext
            HubView(isDisclosed: .constant(true)).environment(\.managedObjectContext, moc)
            HubView(isDisclosed: .constant(false)).environment(\.managedObjectContext, moc)
        }
    }
}
