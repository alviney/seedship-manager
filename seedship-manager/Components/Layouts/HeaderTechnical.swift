//
//  HeaderTechnical.swift
//  seedship-manager
//
//  Created by Alex Viney on 18/12/2022.
//

import Foundation
import SwiftUI

struct HeaderTechnical: View {
    @State var header: String
    
    var body: some View {
        HStack {
            Text(header)
                .modifier(TitleModal())
                .frame(alignment: .leading)
            
            HorizontalDivider()
        }
        .modifier(HeaderBlock())
    }
    
    struct HeaderTechnical_Previews: PreviewProvider {
        static var previews: some View {
            HeaderTechnical(header: "Header")
        }
    }
}
