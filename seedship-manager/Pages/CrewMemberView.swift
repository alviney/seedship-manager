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
                Image(systemName: "person")
                    .font(.largeTitle)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .modifier(Border())
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
    }
}

struct CrewMemberView_Previews: PreviewProvider {
  static var previews: some View {
      CrewMemberView(member: createMember())
  }
}

func createMember() -> CrewMember {
let member = CrewMember(context: PersistenceController.preview.viewContext)
    member.name = "Alex Viney"
    member.age = 43
    member.weight = 88
    member.id =  UUID()
    return member
}
