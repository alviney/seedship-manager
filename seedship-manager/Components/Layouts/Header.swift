//
//  Header.swift
//  seedship-manager
//
//  Created by Alex Viney on 19/12/2022.
//

import Foundation
import SwiftUI

struct Header: View {
    @State var header: String
    
    var body: some View {
        Text(header)
            .modifier(Title())
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    struct Header_Previews: PreviewProvider {
        static var previews: some View {
            Header(header: "Seed ship manager")
        }
    }
}
