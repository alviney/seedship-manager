//
//  PresenterButton.swift
//  seedship-manager
//
//  Created by Alex Viney on 16/1/2023.
//

import SwiftUI

struct PresenterButton<Label> : View where Label : View {
    let viewToShow: AnyView
    let labelView: Label

    @State var isShowingSheet: Bool = false
    
    init(viewToShow: @escaping () -> AnyView, @ViewBuilder label: () -> Label) {
        self.viewToShow = viewToShow()
        self.labelView = label()
    }
    
    var body: some View {
        Button {
            isShowingSheet.toggle()
        } label: {
            AnyView(labelView)
        }
        .modifier(Modal(viewToShow: viewToShow, isShowingSheet: $isShowingSheet))
    }
}
