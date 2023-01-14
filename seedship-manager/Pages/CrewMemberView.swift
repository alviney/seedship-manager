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
                        .modifier(AppText(type: TextType.mediumTitleAlt))
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
            .modifier(Border(borderColor: BorderColor.secondary))
            Spacer()
            Button {
                FacilityCommand.Wake.createFor(member: member, facility: member.facility!)
            } label: {
                Text("Wake Up")
            }
        }
        .font(Font.custom("Aldrich", size: 12))
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
    }
}

struct CrewMemberView_Previews: PreviewProvider {
  static var previews: some View {
      let member = seedCrewMember(moc: PersistenceController.preview.container.viewContext, name: "Test Name")
      CrewMemberView(member: member)
  }
}
