//
//  MemoryGame.swift
//  Memory
//
//  Created by Michael Brünen on 16.06.20.
//  Copyright © 2020 Michael Brünen. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
    
    var cards: [Card]
    
    mutating func choose(_ card: Card) {
        print("Card chosen: \(card)")
        if let chosenIndex = cards.index(of: card) {
            self.cards[chosenIndex].isFaceUp.toggle()
        }
    }
        
    init(numberOfPairs: Int, cardContentFactory: (Int) -> CardContent) {
        cards = [Card]()
        
        for pairIndex in 0 ..< numberOfPairs {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))      // calculate id based on pairIndex
            cards.append(Card(content: content, id: pairIndex * 2 + 1))  // this ensures a unique id
        }
        
        cards.shuffle()
    }
}
