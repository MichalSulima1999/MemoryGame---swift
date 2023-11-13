//
//  MemoGameViewModel.swift
//  lab3
//
//  Created by Michael on 13/11/2023.
//

import SwiftUI

class MemoGameViewModel: ObservableObject {
    private static let emojis = ["😀", "🚀", "🗿", "😅", "🥹", "😇", "🧐", "🫣", "🤌🏻", "🥷🏼"]
    @Published private var model = createMemoGame()
    @Published var themeColor = Color.blue
    
    private static func createMemoGame() -> MemoGameModel<String> {
        return MemoGameModel<String>(numberOfPairsOfCards: 10) { index in
            if emojis.indices.contains(index) {
                return emojis[index]
            } else {
                return "??"
            }
        }
    }
    
    var cards: Array<MemoGameModel<String>.Card> {
        return model.cards
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoGameModel<String>.Card) {
        model.choose(card)
    }
    
    func changeTheme(color: Color) {
        themeColor = color
    }
}
