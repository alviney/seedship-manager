//
//  CrewMember.swift
//  seedship-manager
//
//  Created by Alex Viney on 19/12/2022.
//

import Foundation
import SwiftUI

struct CrewMemberView: View {
    @State var member: CrewMember
    
    var body: some View {
        Text(member.name!)
    }
}
