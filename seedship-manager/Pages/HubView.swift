//
//  HubView.swift
//  seedship-manager
//
//  Created by Alex Viney on 22/12/2022.
//

import SwiftUI

struct HubView: View {
    @Binding var isDisclosed: Bool
    @State var showingSheet: Bool = false
    @State var navIndex = 0
    @State var frameRate = 1.0
    
    var body: some View {
            ZStack {
                Theme.Alpha.color.ignoresSafeArea()
                
                HStack {
                    if isDisclosed {
                        VStack {
                            VStack {
                                HStack {
                                    Picker("", selection: $navIndex) {
                                       Text("Messages").tag(0)
                                       Text("Status").tag(1)
                                       Text("Navigation").tag(2)
                                   }
                                   .pickerStyle(.segmented)
                                   .tabViewStyle(PageTabViewStyle())
                                }
                                                      
                               TabView(selection: $navIndex,
                                       content:  {
                                   TasksView()
                                       .tag(0)
                               })
                               .tabViewStyle(PageTabViewStyle())
                            }
                            .modifier(Border())
                            
                            HStack {
                                Icon(name: "clock")
                                Slider(value: $frameRate, in: 0.1...100)
                                Text("\(frameRate, specifier: "%.2f")")
                                
                            }
                            .padding([.top], 8)
                        }
                    } else {
                        Spacer()
                    }

                    VStack {
                        if isDisclosed {
                            PresenterButton {
                                AnyView(ManualView())
                            } label: {
                                Icon(name: "book.closed", size: 20)
                            }
                            Spacer()
                        }
                        
                        HStack {
                            Button {
                                withAnimation {
                                    isDisclosed.toggle()
                                }
                            } label: {
                                if isDisclosed {
                                    Icon(name: "chevron.up")
                                } else {
                                    Icon(name: "chevron.down")
                                }
                            }
                        }
                    }
                }
                .frame(alignment: .trailing)
                .padding(12)
            }
        .frame(height: isDisclosed ? 300 : 50, alignment: .top)
                  .clipped()
    }
    
    struct HubView_Previews: PreviewProvider {
        static var previews: some View {
            HubView(isDisclosed: .constant(true))
            HubView(isDisclosed: .constant(false))
        }
    }
}
