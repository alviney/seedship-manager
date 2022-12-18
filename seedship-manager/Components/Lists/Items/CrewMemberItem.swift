//
//  CrewMemberItem.swift
//  seedship-manager
//
//  Created by Alex Viney on 17/12/2022.
//

import SwiftUI

struct CrewMemberItem: View {
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Text("Alex Viney")
                    HStack {
                        Text("")
                            .frame(width: 1)
                            .background(Color.black)
                    }
                    .frame(maxWidth: .infinity)
                    HStack {
    
                        Text("Age: 33")
                            .fixedSize()
                            .modifier(BodyExtraSmall())
                        Text("Weight: 88kg")
                            .fixedSize()
                            .modifier(BodyExtraSmall())
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .frame(maxWidth: .infinity)
                
                Text("In Cryo Chamber")
                    .modifier(BodyExtraSmall())
            }
            .padding(12)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color(CustomColor.BorderDefault.rawValue), lineWidth: 2)
            )
        }
        .padding(2)
        .frame(maxWidth: .infinity)
        .modifier(BodySmall())
    }
    
    struct CrewMemberItem_Previews: PreviewProvider {
        static var previews: some View {
            CrewMemberItem()
        }
    }
}
