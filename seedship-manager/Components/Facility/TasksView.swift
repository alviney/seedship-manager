//
//  Tasks.swift
//  seedship-manager
//
//  Created by Alex Viney on 24/12/2022.
//

import SwiftUI

struct TasksView: View {
    @State var title: String?
    
    var body: some View {
        VStack {
            Text(title ?? "Status")
                .modifier(AppText(type: TextType.largeTitle))
            Spacer()
        }        

//        .background(Color.black)
//        .cornerRadius(8)
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
    }
}
