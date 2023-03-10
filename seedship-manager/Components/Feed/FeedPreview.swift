//
//  FeedPreview.swift
//  seedship-manager
//
//  Created by Alex Viney on 23/1/2023.
//

import SwiftUI

struct FeedPreview: View {
    @FetchRequest(sortDescriptors: [SortDescriptor(\.createdAt)]) var messages: FetchedResults<FeedMessage>
    
    
    var body: some View {
        HStack {
            Icon(name: "person.crop.circle.badge.exclamationmark", size: 12)
            Text("Nero Ren has requested a transfer!")
                .customFont(textStyle: .caption)
                .offset(y: 1)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(8)
        .padding([.leading], 10)
        .background(Theme.Charlie.color.opacity(0.5))
        .cornerRadius(8)        
    }
}

struct FeedPreview_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Theme.Alpha.color.ignoresSafeArea()
            FeedPreview()
        }
    }
}
