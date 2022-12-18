//
//  SubheaderTechnical.swift
//  seedship-manager
//
//  Created by Alex Viney on 18/12/2022.
//

import Foundation
import SwiftUI

struct SubHeaderTechnical: View {
    @State var header: String
    
    var body: some View {
        HStack {
            HStack {
                Text(header)
                    .modifier(Subheader())
            }
            .modifier(SubheaderBlock())
        }
        .padding([.leading], 16)
    }
    
    struct SubHeaderTechnical_Previews: PreviewProvider {
        static var previews: some View {
            SubHeaderTechnical(header: "Subheader")
        }
    }
}
