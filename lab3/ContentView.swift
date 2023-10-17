//
//  ContentView.swift
//  lab3
//
//  Created by Michael on 10/10/2023.
//

import SwiftUI

enum ThemeType {
    case BLUE, RED, GREEN
}

struct ContentView: View {
    @State private var isFaceUp = false
    @State var cardContents: [AnyView] = [
        AnyView(Text("😀")),
        AnyView(Image(systemName: "star.fill")),
        AnyView(Text("🚀")),
        AnyView(Text("🗿")),
        AnyView(Text("😅")),
        AnyView(Text("🥹")),
        AnyView(Text("😇")),
        AnyView(Text("🧐")),
        AnyView(Text("🫣")),
        AnyView(Text("😴")),
        AnyView(Text("🤌🏻")),
        AnyView(Text("🥷🏼")),
    ]
    let cardContents1: [AnyView] = [
        AnyView(Text("😀")),
        AnyView(Image(systemName: "star.fill")),
        AnyView(Text("🚀")),
        AnyView(Text("🗿")),
        AnyView(Text("😅")),
        AnyView(Text("🥹")),
        AnyView(Text("😇")),
        AnyView(Text("🧐")),
        AnyView(Text("🫣")),
        AnyView(Text("😴")),
        AnyView(Text("🤌🏻")),
        AnyView(Text("🥷🏼")),
    ]
    let cardContents2: [AnyView] = [
        AnyView(Text("👩🏻‍🚀")),
        AnyView(Text("👨🏻‍💻")),
        AnyView(Text("🧍🏻‍♀️")),
        AnyView(Text("🙆‍♂️")),
        AnyView(Text("👰‍♀️")),
        AnyView(Text("🦸‍♀️")),
        AnyView(Text("🤦‍♀️")),
        AnyView(Text("💆‍♂️")),
        AnyView(Text("🏃‍♀️")),
        AnyView(Text("😴")),
        AnyView(Text("🤌🏻")),
        AnyView(Text("🥷🏼")),
        AnyView(Text("🫣")),
        AnyView(Text("😴")),
        AnyView(Text("🏃‍♂️")),
        AnyView(Text("🥷🏼")),
    ]
    let cardContents3: [AnyView] = [
        AnyView(Text("👊")),
        AnyView(Text("👣")),
        AnyView(Text("👨‍🦰")),
        AnyView(Text("💍")),
    ]

    
    @State private var cardCount = 2
    @State private var currentTheme = Color.blue
    
    var cardRemover: some View {
        adjustCardNumber(by: -2, symbol: "minus")
            .disabled(cardCount <= 2)
    }
    
    var cardAdder: some View {
        adjustCardNumber(by: 2, symbol: "plus")
            .disabled(cardCount >= cardContents.count)
    }
    
    func shuffleCards(cards: [AnyView]) -> [AnyView] {
        return cards.shuffled()
    }
    
    var themeButton1: some View {
        ThemeView(symbol: "star", text: "Theme 1", theme: $currentTheme) {
            cardContents = shuffleCards(cards: cardContents1)
            currentTheme = .blue
        }
    }
    
    var themeButton2: some View {
        ThemeView(symbol: "heart", text: "Theme 2", theme: $currentTheme) {
            cardContents = shuffleCards(cards: cardContents2)
            currentTheme = .red
        }
    }
    
    var themeButton3: some View {
        ThemeView(symbol: "moon.stars.fill", text: "Theme 3", theme: $currentTheme) {
            cardContents = shuffleCards(cards: cardContents3)
            currentTheme = .green
        }
    }
    
    func adjustCardNumber(by offset:Int, symbol:String) -> some View {
        return Button(action: { cardCount += offset }) {
            Image(systemName: symbol)
                .font(.largeTitle)
                .padding()
        }
    }
    
    var body: some View {
        Text("Memo").font(.largeTitle)
        Spacer()
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], spacing: 10) {
                ForEach(0..<cardContents.count, id: \.self) { i in
                    CardView(card: cardContents[i], theme: $currentTheme)
                        .padding()
                }
            }
            .foregroundColor(.blue)
        }
        
//        HStack {
//            cardRemover
//            Spacer()
//            cardAdder
//        }
        
        HStack {
            themeButton1
            Spacer()
            themeButton2
            Spacer()
            themeButton3
        }
    }}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
