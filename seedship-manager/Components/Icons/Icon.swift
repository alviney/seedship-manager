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
    @State var theme: Theme = Theme.Alpha
    @State var color: Color?
    public var active: Binding<Bool>?
    
    var body: some View {
        Image(systemName: name)
            .font(.system(size: size ?? 24.0))
            .if(color == nil) { view in
                view.foregroundColor(active == nil ? theme.iconFocus : active!.wrappedValue ? theme.iconFocus : theme.icon)
            }
            .if(color != nil) { view in
                view.foregroundColor(color)
            }
            
    }
}

//struct Icon_Previews: PreviewProvider {
//    static var previews: some View {
//        Icon(name: "book.closed")
//    }
//}
