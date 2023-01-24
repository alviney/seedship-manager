//
//  CrewMember.swift
//  seedship-manager
//
//  Created by Alex Viney on 19/12/2022.
//

import SwiftUI

struct CrewMemberView: View {
    @State var member: CrewMember
    
    var body: some View {
        VStack () {
            HStack {
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(member.name ?? "Name")
                        VStack (alignment: .leading, spacing: 4) {
                            Text("Age: 44")
                            Text("Absolute: 1278")
                            Text("Weight: 84kg")
                            Text("Height: 181cm")
                        }
                    }
                    Spacer()
                    
                    Image(CustomImage.Avatar())
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(8)
                        .frame(width: 100)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 8)
//                                .stroke(Theme.Alpha.navigation, lineWidth: 2)
//                        )
                }
//                .frame(maxWidth: .infinity, alignment: .leading)
                .itemBG()
            }

            Spacer()
            Button {
                FacilityCommand.Wake.createFor(member: member, facility: member.facility!)
            } label: {
                Text("Wake Up")
            }
        }
        .font(Font.custom(CustomFont.Technical.rawValue, size: 12))
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .modifier(Nav(title: "\(member.name ?? "") : ID8192"))
        .imageBG(image: Image(CustomImage.CrewBackgroundAwake.rawValue))
    }
}

struct CrewMemberView_Previews: PreviewProvider {
  static var previews: some View {
      CrewMemberView(member: createMember())
  }
}

func createMember(name: String = "Nero Ren") -> CrewMember {
let member = CrewMember(context: PersistenceController.preview.viewContext)
    member.name = name
    member.age = 43
    member.weight = 88
    member.id =  UUID()
    return member
}
