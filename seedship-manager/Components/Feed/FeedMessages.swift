//
//  MessageList.swift
//  seedship-manager
//
//  Created by Alex Viney on 22/1/2023.
//

import SwiftUI

struct FeedMessages: View {
    @FetchRequest(sortDescriptors: [SortDescriptor(\.createdAt)]) var messages: FetchedResults<FeedMessage>
    @State var message: FeedMessage?
    
    var body: some View {
        ZStack {
            if message != nil {
                FeedMessageDetail(message: $message)
            } else {
                ScrollView {
                    VStack {
                        ForEach(messages) { message in
                            Button {
                                withAnimation {
                                    self.message = message
                                }
                            } label: {
                                HStack (spacing: 4) {
                                    Icon(name: "info.circle", size: 10, color: Theme.Charlie.text)
                                    
                                    Group {
                                        if (message.type == FeedMessageAPI.Task.rawValue) {
                                            Text("Task: ")
                                                .customFont(textStyle: .caption, color: .constant(Theme.MessageTask))
                                        }
                                        
                                        Text(message.preview ?? "Test")
                                            .customFont(textStyle: .caption, theme: Theme.Charlie)
                                    }
                                    .offset(y: 1)
                                }
                                .padding([.trailing], 8)
                                .padding(4)
                                .background(Theme.Charlie.color)
                                .cornerRadius(4)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }                
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct FeedMessages_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.viewContext
        ZStack {
            Theme.Alpha.color.ignoresSafeArea()
            FeedMessages().environment(\.managedObjectContext, context)
        }
    }
}
