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
        HStack {
            ForEach(memoryGame.cards) { card in
                CardView(card: card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .onTapGesture {
                        self.memoryGame.choose(card)
                    }
            }
        }
        .padding()
        .foregroundColor(Color.orange)
        .font(memoryGame.cards.count == 10 ? .title : .largeTitle)
    }
}

struct MemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        MemoryGameView(memoryGame: EmojiMemoryGame())
    }
}
