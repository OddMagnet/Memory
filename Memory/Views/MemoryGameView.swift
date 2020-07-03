//
//  MemoryGameView.swift
//  Memory
//
//  Created by Michael Brünen on 16.06.20.
//  Copyright © 2020 Michael Brünen. All rights reserved.
//

import SwiftUI

struct MemoryGameView: View {
    // instance of the games ViewModel
    @ObservedObject var memoryGame: EmojiMemoryGame
    
    var body: some View {
        NavigationView {
            VStack {
                GridView(memoryGame.cards) { card in
                    CardView(card: card)
                        .onTapGesture {
                            self.memoryGame.choose(card)
                    }
                    .padding(5)
                }
            }
            .padding()
            .foregroundColor(memoryGame.color)
            .navigationBarTitle("Memory: \(memoryGame.themeName) - \(memoryGame.score)", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: self.memoryGame.newGame) {
                Text("New Game")
            })
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct MemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        MemoryGameView(memoryGame: EmojiMemoryGame())
    }
}
