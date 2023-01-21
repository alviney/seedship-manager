//
//  Tasks.swift
//  seedship-manager
//
//  Created by Alex Viney on 24/12/2022.
//

import SwiftUI

struct TasksView: View {
    @State var title: String?
    @FetchRequest(sortDescriptors: []) var commands: FetchedResults<Command>
    
    var body: some View {
        VStack {
            ForEach (commands) { command in
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text(command.name ?? "Task")
                            Spacer()
                            Text(command.queue?.member?.name ?? "Target")
                        }
                        
                        ProgressView(command.status ?? "Task", value: command.progress)
//                        VStack (alignment: .leading, spacing: 4) {
//                            Text("Age: 44")
//                            Text("Absolute: 1278")
//                            Text("Weight: 84kg")
//                            Text("Height: 181cm")
//                        }
                    }
                    Spacer()
                    Image(systemName: "person")
                        .font(.largeTitle)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .modifier(Border())
            }
            Spacer()
        }
        .font(Font.custom(CustomFont.Technical.rawValue, size: 12))
        .padding(2)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
    }
    
    struct TasksView_Previews: PreviewProvider {
        static var previews: some View {
            let context = PersistenceController.preview.container.viewContext
            TasksView().environment(\.managedObjectContext, context)
        }
    }
}
