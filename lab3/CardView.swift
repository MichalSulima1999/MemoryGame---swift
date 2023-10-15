//
//  CardView.swift
//  lab3
//
//  Created by Michael on 10/10/2023.
//

import SwiftUI

struct Card<Content>: Identifiable where Content: View {
    let id = UUID()
    let content: Content
}

struct CardView<AnyView>: View where AnyView: View {
    @State var isFaceUp = false
    var card: AnyView
    
    init(card: AnyView) {
        self.card = card
    }
    
    var body: some View {
        Group {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.blue)
                    .frame(width: 150, height: 200)
                if isFaceUp {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.white)
                        .frame(width: 145, height: 195)
                    card
                        .font(.largeTitle)
                    
                }
            }
        }
        .onTapGesture {
            withAnimation {
                isFaceUp.toggle()
            }
        }
        .opacity(isFaceUp ? 1.0 : 0.5)
        .contentShape(RoundedRectangle(cornerRadius: 12))
    }
}
