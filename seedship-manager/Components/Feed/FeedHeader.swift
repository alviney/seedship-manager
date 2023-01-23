//
//  FeedHeader.swift
//  seedship-manager
//
//  Created by Alex Viney on 23/1/2023.
//

import SwiftUI

struct FeedHeader: View {
    var body: some View {
        HStack {
            Icon(name: "antenna.radiowaves.left.and.right.circle")
            Text("System Feed")
                .customFont()
                .offset(y: 1)
            Spacer()
            HStack(spacing: 0) {
                Text("Connection: ")
                Text("Live")
                    .customFont(color: .constant(Theme.Alpha.accentActive), size: 8)
            }
            Spacer()
            Text("Elapsed Time: 1891239")
        }
        .customFont(size: 8)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding([.leading, .trailing], 8)
    }
}

struct FeedHeader_Previews: PreviewProvider {
    static var previews: some View {
        FeedHeader()
    }
}
