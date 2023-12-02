//
//  ContentView.swift
//  lab3
//
//  Created by Michael on 10/10/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: MemoGameViewModel
    typealias Card = MemoGameModel<String>.Card
    
    @State private var lastScoreChange = (0, causedByCardId: "")
    
    var body: some View {
        VStack {
            Text("Memo").font(.largeTitle)
            Spacer()
            ScrollView {
                cards.animation(.default, value: viewModel.cards)
            }
            HStack {
                score
                Spacer()
                shuffle
            }
            HStack {
                themeButton1
                Spacer()
                themeButton2
                Spacer()
                themeButton3
            }
        }
    }
    
    private var themeButton1: some View {
        ThemeView(viewModel: viewModel, symbol: "star", text: "Theme 1", ownColor: Color.blue)
    }
    
    private var themeButton2: some View {
        ThemeView(viewModel: viewModel, symbol: "heart", text: "Theme 2", ownColor: Color.red)
    }
    
    private var themeButton3: some View {
        ThemeView(viewModel: viewModel, symbol: "moon.stars.fill", text: "Theme 3", ownColor: Color.green)
    }
    
    private var score: some View {
        Text("Score: \(viewModel.score)")
            .font(.title2)
            .animation(nil)
    }
    
    private var shuffle: some View {
        Button("Shuffle") {
            withAnimation {
                viewModel.shuffle()
            }
        }
    }
    
    private func choose(_ card: Card) {
        withAnimation {
            let scoreBeforeChoosing = viewModel.score
            viewModel.choose(card)
            let scoreChange = viewModel.score - scoreBeforeChoosing
            lastScoreChange = (scoreChange, causedByCardId: card.id)
        }
    }
    
    private func scoreChange(causedBy card: Card) -> Int {
        let (amount, id) = lastScoreChange
        return card.id == id ? amount : 0
    }
    
    private var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards) { card in
                CardView(card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
                    .overlay(FlyingNumber(number: scoreChange(causedBy: card)))
                    .zIndex(scoreChange(causedBy: card) != 0 ? 100 : 0)
                    .onTapGesture {
                        choose(card)
                    }
            }
        }
        .foregroundColor(viewModel.themeColor)
    }
}
