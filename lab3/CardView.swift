//
//  CardView.swift
//  lab3
//
//  Created by Michael on 10/10/2023.
//

import SwiftUI

struct CardView: View {
    var card: MemoGameModel<String>.Card
    @State private var offset: CGFloat = 200.0
    @State private var isRotating = 0.0
    
    init(_ card: MemoGameModel<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        CirclePart(startAngle: .degrees(-90), endAngle: .degrees(150))
            .fill(.blue)
            .frame(width: 70, height: 70)
            .rotationEffect(.degrees(isRotating))
                        .onAppear {
                            withAnimation(.linear(duration: 1)
                                    .speed(0.1).repeatForever(autoreverses: false)) {
                                isRotating = 360.0
                            }
                        }
            .overlay(
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
                    .rotationEffect(.degrees(card.isMatched ? 360 : 0))
                    .animation(Animation.easeInOut(duration: 2.0), value: offset)
            )
            .transformIntoCard(isFaceUp: card.isFaceUp)
            .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}
