//
//  EmojiMemoryGame.swift
//  Memory
//
//  Created by Michael Brünen on 16.06.20.
//  Copyright © 2020 Michael Brünen. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame {
    // instance of the games model
    private var memoryGame = createMemoryGame()
    
    // create an instance of the games model
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻", "🎃", "🕷", "🕸", "🦇"]
        
        return MemoryGame<String>(numberOfPairs: Int.random(in: 2...5)) { index in
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

