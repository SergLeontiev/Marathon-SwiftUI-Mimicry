//
//  ContentView.swift
//  Marathon-SwiftUI-Mimicry
//
//  Created by Sergey Leontiev on 19.12.24..
//

import SwiftUI

struct ContentView: View {
    @State var isCollapsed: Bool = true
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button {
                    withAnimation() {
                        isCollapsed.toggle()
                    }
                } label: {
                    Rectangle()
                        .fill(.blue)
                        .cornerRadius(isCollapsed ? 8 : 16)
                }
                .allowsHitTesting(isCollapsed)
                .overlay(alignment: isCollapsed ? .center : .topLeading) {
                    Button {
                        withAnimation() {
                            isCollapsed.toggle()
                        }
                    } label: {
                        HStack {
                            Image(systemName: "arrowshape.backward.fill")
                                .opacity(isCollapsed ? 0 : 1)
                                .scaleEffect(isCollapsed ? 0.01 : 1)
                            Text(isCollapsed ? "Open" : "Back")
                                .contentTransition(.identity)
                                .bold()
                                .offset(x: isCollapsed ? -16 : 0)
                        }
                        .foregroundStyle(.white)
                    }
                    .allowsHitTesting(!isCollapsed)
                    .offset(x: isCollapsed ? 0 : 16, y: isCollapsed ? 0 : 16)
                }
                .frame(
                    width: isCollapsed ? 80 : nil,
                    height: isCollapsed ? 50 : 400
                )
                .padding(isCollapsed ? 16 : 32)
                .offset(y: isCollapsed ? 0 : -150)
            }
            
        }
    }
}

#Preview {
    ContentView()
}
