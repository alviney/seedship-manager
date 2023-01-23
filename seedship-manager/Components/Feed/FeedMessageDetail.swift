//
//  MessageDetail.swift
//  seedship-manager
//
//  Created by Alex Viney on 22/1/2023.
//

import SwiftUI

struct FeedMessageDetail: View {
    @Binding var message: FeedMessage?
    
    var body: some View {
        HStack {
            Button (action: {
                withAnimation {
                    message = nil
                }                                
            }) {
                HStack {
                    Icon(name: "chevron.left")
                }
                    .frame(maxHeight: .infinity)
                    .frame(width: 40)
//                    .backround(Theme.Beta.color.opacity(0.5))
                    .background(.red)
                    .contentShape(Rectangle())
            }
            .contentShape(Rectangle())
            
            Spacer()
            
            VStack {
                Text(message?.preview ?? "message")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct FeedMessageDetail_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Theme.Alpha.color.ignoresSafeArea()
            FeedMessageDetail(message: .constant(createMessage()))
        }
    }
}

func createMessage() -> FeedMessage {
    let message = FeedMessage(context: PersistenceController.preview.viewContext)
    message.preview = "Preview message"
    return message
}
