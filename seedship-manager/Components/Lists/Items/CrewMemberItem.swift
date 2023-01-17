//
//  CrewMemberItem.swift
//  seedship-manager
//
//  Created by Alex Viney on 17/12/2022.
//

import SwiftUI

struct CrewMemberItem: View {
    @ObservedObject var member: CrewMember
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Text(String(member.name!))
                    HStack {
                        Text("")
                            .frame(width: 1)
                            .background(Color.black)
                    }
                    .frame(maxWidth: .infinity)
                    HStack {
                        Text("Age: " + String(member.age))
                            .fixedSize()
                            .modifier(AppText(type: TextType.extraSmallBodyAlt()))
                        Text("Weight: \(member.weight)kg")
                            .fixedSize()
                            .modifier(AppText(type: TextType.extraSmallBodyAlt()))
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .frame(maxWidth: .infinity)
                
                Text("In \(member.facility?.name ?? "corridors")")
                    .modifier(AppText(type: TextType.extraSmallBodyAlt()))
            }
            .padding(12)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color(CustomColor.BorderSecondary.rawValue), lineWidth: 2)
            )
        }
        .padding(2)
        .frame(maxWidth: .infinity)
        .modifier(AppText(type: TextType.smallBodyAlt()))
    }
//
//    struct CrewMemberItem_Previews: PreviewProvider {
//        static var previews: some View {
//            CrewMemberItem(member: CrewMember(name: "Nero Ren", age: 43, id: UUID()))
//        }
//    }
}
