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
        GridView(memoryGame.cards) { card in
            CardView(card: card)
                .onTapGesture {
                    self.memoryGame.choose(card)
            }
            .padding(5)
        }
        .padding()
        .foregroundColor(Color.orange)
    }
}

struct MemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        MemoryGameView(memoryGame: EmojiMemoryGame())
    }
}
