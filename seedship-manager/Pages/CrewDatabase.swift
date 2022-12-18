//
//  CrewDatabase.swift
//  seedship-manager
//
//  Created by Alex Viney on 18/12/2022.
//

import Foundation
import SwiftUI

struct CrewDatabase: View {
    @Environment(\.dismiss) var dismiss
    @State var members: [String] = []
    
    var body: some View {
        ZStack {
            Color(CustomColor.CardBackground.rawValue).ignoresSafeArea()
            VStack(spacing: 20) {
                HeaderTechnical(header: "Crew")
               
                VStack {
                    Text("Connection: Live")
                        .modifier(BodyExtraSmall(color: Color.white))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading], 16)
                    
                    VStack(spacing: 24) {
                        SubHeaderTechnical(header: "Database")
                            .padding([.top], 16)
                        
                        ScrollView {
                            CrewMemberItem()
                            CrewMemberItem()
                            CrewMemberItem()
                            CrewMemberItem()
                        }
                        .frame(maxHeight: 300)
                        HorizontalDivider()
                        
                        Spacer()
                    }
                    .modifier(ContentBlock())
                    
                    Spacer()
                }
            }
            .padding(24)
        }
    }
    
    struct CrewDatabase_Previews: PreviewProvider {
        static var previews: some View {
            CrewDatabase()
        }
    }
}
