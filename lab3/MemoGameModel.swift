//
//  MemoGameModel.swift
//  lab3
//
//  Created by Michael on 07/11/2023.
//

import SwiftUI

struct MemoGameModel<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>

    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex + 1)a"))
            cards.append(Card(content: content, id: "\(pairIndex + 1)b"))
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    var indexOfOneFaceUpCard: Int? {
        get {
            cards.indices.filter { index in cards[index].isFaceUp }.only
        }
        set {
            cards.indices.forEach {
                cards[$0].isFaceUp = (newValue == $0)
            }
        }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}) {
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                if let potentialIndex = indexOfOneFaceUpCard {
                    if cards[chosenIndex].content == cards[potentialIndex].content {
                        cards[chosenIndex].isMatched = true
                        cards[potentialIndex].isMatched = true
                    }
                } else {
                    indexOfOneFaceUpCard = chosenIndex
                }
                cards[chosenIndex].isFaceUp = true
            }
        }
    }
    
    func indexOf(of card: Card) -> Int? {
        for index in cards.indices {
            if(cards[index].id == card.id) {
                return index
            }
        }
        return nil
    }
    
    struct Card: Equatable, Identifiable {
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
        
        var id: String
    }
}

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
