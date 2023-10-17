//
//  ThemeView.swift
//  lab3
//
//  Created by Michael on 17/10/2023.
//

import SwiftUI

struct ThemeView: View {
    let symbol: String
    let text: String
    @Binding var theme: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack {
                Image(systemName: symbol)
                    .foregroundColor(theme)
                    .font(.largeTitle)
                Text(text).font(.caption).foregroundColor(theme)
            }
        }
    }
}
