//
//  EmojiMemoryGame.swift
//  Memory
//
//  Created by Michael Brünen on 16.06.20.
//  Copyright © 2020 Michael Brünen. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    // instance of the games model
   @Published private var memoryGame = createMemoryGame()
    
    // create an instance of the games model
    static func createMemoryGame() -> MemoryGame<String> {
        
        let emojiTheme = themes.randomElement()!
        let emojis = emojiTheme.emojis.shuffled()
        
        return MemoryGame<String>(theme: emojiTheme) { index in
            return emojis[index]
        }
    }
    
    // MARK: - Access to the model
    var cards: [MemoryGame<String>.Card] {
        memoryGame.cards
    }
    
    // MARK: - Intents
    func choose(_ card: MemoryGame<String>.Card) {
        memoryGame.choose(card)
    }
}

