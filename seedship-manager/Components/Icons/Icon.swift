//
//  MediumIcon.swift
//  seedship-manager
//
//  Created by Alex Viney on 22/12/2022.
//

import SwiftUI

struct Icon: View {
    @State var name: String
    @State var size: CGFloat?
    
    var body: some View {
        Image(systemName: name)
            .font(.system(size: size ?? 24.0))
            .foregroundColor(Color(CustomColor.TitleFont.rawValue))
    }
}

struct Icon_Previews: PreviewProvider {
    static var previews: some View {
        Icon(name: "book.closed")
    }
}
