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
    @Binding var theme: Color
    var card: AnyView
    
    init(card: AnyView, theme: Binding<Color>) {
        self.card = card
        self._theme = theme
    }
    
    var body: some View {
        Group {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(theme)
                    .frame(width: 60, height: 80)
                if isFaceUp {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.white)
                        .frame(width: 55, height: 75)
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
        .aspectRatio(CGSize(width: 2, height: 3), contentMode: .fill)
        .contentShape(RoundedRectangle(cornerRadius: 12))
        .onChange(of: theme) { newTheme in
            isFaceUp = false
        }
    }
}
