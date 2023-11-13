//
//  ThemeView.swift
//  lab3
//
//  Created by Michael on 17/10/2023.
//

import SwiftUI

struct ThemeView: View {
    @ObservedObject var viewModel: MemoGameViewModel
    let symbol: String
    let text: String
    var ownColor: Color
    
    var body: some View {
        Button(action: {
            viewModel.changeTheme(color: ownColor)
        }) {
            VStack {
                Image(systemName: symbol)
                    .foregroundColor(viewModel.themeColor)
                    .font(.largeTitle)
                Text(text).font(.caption).foregroundColor(viewModel.themeColor)
            }
        }
    }
}
