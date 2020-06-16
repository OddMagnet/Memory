//
//  MemoryGameView.swift
//  Memory
//
//  Created by Michael Brünen on 16.06.20.
//  Copyright © 2020 Michael Brünen. All rights reserved.
//

import SwiftUI

struct MemoryGameView: View {
    var memoryGame: EmojiMemoryGame
    
    var body: some View {
        HStack {
            ForEach(memoryGame.cards) { card in
                CardView(card: card)
                    .onTapGesture {
                        self.memoryGame.choose(card: card)
                    }
            }
        }
        .padding()
        .foregroundColor(Color.orange)
        .font(.largeTitle)
    }
}

struct MemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        MemoryGameView(memoryGame: EmojiMemoryGame())
    }
}
