//
//  HorizontalDivider.swift
//  seedship-manager
//
//  Created by Alex Viney on 18/12/2022.
//

import Foundation
import SwiftUI

struct HorizontalDivider: View {
    @State var height: CGFloat = 2
    
    var body: some View {
        Text("")
            .frame(maxWidth: .infinity)
            .frame(height: height)
            .background(Color.black)
    }
}
