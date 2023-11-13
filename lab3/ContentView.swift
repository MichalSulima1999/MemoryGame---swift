//
//  ContentView.swift
//  lab3
//
//  Created by Michael on 10/10/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: MemoGameViewModel
    
    var themeButton1: some View {
        ThemeView(viewModel: viewModel, symbol: "star", text: "Theme 3", ownColor: Color.blue)
    }
    
    var themeButton2: some View {
        ThemeView(viewModel: viewModel, symbol: "heart", text: "Theme 3", ownColor: Color.red)
    }
    
    var themeButton3: some View {
        ThemeView(viewModel: viewModel, symbol: "moon.stars.fill", text: "Theme 3", ownColor: Color.green)
    }
    
    var body: some View {
        VStack {
            Text("Memo").font(.largeTitle)
            Spacer()
            ScrollView {
                cards.animation(.default, value: viewModel.cards)
            }
            Button("SHUFFLE") {
                viewModel.shuffle()
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
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards) { card in
                CardView(card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
            }
        }
        .foregroundColor(viewModel.themeColor)
    }
}
