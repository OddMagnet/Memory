//
//  MemoryGame.swift
//  Memory
//
//  Created by Michael Brünen on 16.06.20.
//  Copyright © 2020 Michael Brünen. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var contentTye: CardContent
    }
    
    var cards: [Card]
    
    func choose(card: Card) {
        print("Card chosen: \(card)")
    }
}
