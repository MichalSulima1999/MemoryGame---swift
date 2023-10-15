//
//  ContentView.swift
//  lab3
//
//  Created by Michael on 10/10/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var isFaceUp = false
    let cardContents: [AnyView] = [
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
    
    @State private var cardCount = 2
    
    func adjustCardNumber(by offset: Int, symbol: String) {
        let newCount = cardCount + offset
        if newCount >= 2 && newCount <= cardContents.count {
            cardCount = newCount
        }
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))], spacing: 10) {
                ForEach(0..<cardCount, id: \.self) { i in
                    CardView(card: cardContents[i])
                        .padding()
                }
            }
            .foregroundColor(.blue) // Ustawienie koloru pierwszoplanowego dla LazyVGrid
        }
        
        HStack {
            Button(action: { adjustCardNumber(by: -2, symbol: "minus") }) {
                Image(systemName: "minus.circle")
                    .font(.largeTitle)
                    .padding()
            }
            .disabled(cardCount <= 2)
            
            Button(action: { adjustCardNumber(by: 2, symbol: "plus") }) {
                Image(systemName: "plus.circle")
                    .font(.largeTitle)
                    .padding()
            }
            .disabled(cardCount >= cardContents.count)
        }
    }}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
