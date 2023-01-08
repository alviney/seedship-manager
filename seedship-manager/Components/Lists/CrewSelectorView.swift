//
//  CrewSelectorView.swift
//  seedship-manager
//
//  Created by Alex Viney on 26/12/2022.
//

import SwiftUI

struct CrewSelectorView: View {
    var predicate: NSPredicate?
    var onSelectMember: ((CrewMember) -> Void)?
    
    @FetchRequest var members: FetchedResults<CrewMember>
    
    init(onSelectMember: ((CrewMember) -> Void)? = nil, predicate: NSPredicate? = nil) {
        self._members = FetchRequest(entity: CrewMember.entity(), sortDescriptors: [], predicate: predicate)
        self.onSelectMember = onSelectMember
    }
    
    var body: some View {
        ZStack {
            Color(CustomColor.DefaultBackground.rawValue).ignoresSafeArea()
            
            VStack {
                List (members) { member in
                    Button {
                        self.onSelectMember?(member)
                    } label: {
                        CrewMemberItem(member: member)
                    }
                    .modifier(ListItemPlain())
                }
                .modifier(ListPlain())
            }
            .padding(12)
        }
    }
}

struct CrewSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        CrewSelectorView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
