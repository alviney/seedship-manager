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
            HStack {
                Icon(name: "person.fill")
                VStack(spacing: 4) {
                    HStack {
                        Text(String(member.name!))
                        Spacer()
                    }
                    HStack {
                        Text("In \(member.facility?.name ?? "corridors")")
                            .font(Font.custom(CustomFont.Technical.rawValue, size: 10))
                        Spacer()
                    }
                }
                
                VStack(spacing: 8) {
                    HStack {
                        ProgressView(value: 0.5)
                            .tint(Theme.Health)
                        Icon(name: "heart.fill", size: 12, color: Theme.Health)
                    }
                                        
                    VStack {
//                        HStack {
//                            Text("Age \(String(member.age))")
//                                .modifier(CFont(textStyle: .footnote, theme: .Beta))
//                                .fixedSize()
//                            Spacer()
//                            Text("Weight: \(member.weight)kg")
//                                .modifier(CFont(textStyle: .footnote, theme: .Beta))
//                                .fixedSize()
//                        }
                        HStack {
                            Spacer()
                            Text("Engineer")
                                .modifier(CFont(textStyle: .footnote, color: .constant(Theme.Occupation)))
                            .fixedSize()
                            Icon(name: "graduationcap.fill", size: 12, color: Theme.Occupation)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .frame(width: 150)
            }
            .padding(8)
            .background(Theme.Beta.color)
            .cornerRadius(8)
            .modifier(Border(padding: 0))
        }
        .padding(2)
        .frame(maxWidth: .infinity)
        .modifier(CFont(textStyle: .body, theme: .Beta))
    }

    struct CrewMemberItem_Previews: PreviewProvider {
        static var previews: some View {
            VStack {
                CrewMemberItem(member: createMember())
                CrewMemberItem(member: createMember(name: "Alexander Lizaar"))
            }
            .padding(12)
            .background(Theme.Alpha.color)
        }
    }
}
