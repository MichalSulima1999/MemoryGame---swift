//
//  lab3App.swift
//  lab3
//
//  Created by Michael on 10/10/2023.
//

import SwiftUI

@main
struct lab3App: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: MemoGameViewModel())
        }
    }
}
