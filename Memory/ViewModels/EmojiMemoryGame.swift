//
//  EmojiMemoryGame.swift
//  Memory
//
//  Created by Michael Brünen on 16.06.20.
//  Copyright © 2020 Michael Brünen. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame {
    private var memoryGame = createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻", "🎃"]
        
        return MemoryGame<String>(numberOfPairs: 2) { index in
            return emojis[index]
        }
    }
    
    // MARK: - Access to the model
    var cards: [MemoryGame<String>.Card] {
        memoryGame.cards
    }
    
    // MARK: - Intents
    func choose(card: MemoryGame<String>.Card) {
        memoryGame.choose(card: card)
    }
}

