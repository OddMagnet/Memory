//
//  MemoryGame.swift
//  Memory
//
//  Created by Michael Brünen on 16.06.20.
//  Copyright © 2020 Michael Brünen. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
    
    var cards: [Card]
    var indexOfOnlyUnmatchedFaceUpCard: Int?
    
    mutating func choose(_ card: Card) {
        print("Card chosen: \(card)")
        // only act on cards that have an existing index, are not face up and are not already matched
        if let chosenIndex = cards.index(of: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            // if there is a face up card
            if let potentialMatchIndex = indexOfOnlyUnmatchedFaceUpCard {
                // check if they are the same card (have the same content)
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    // a match happened
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                // reset index of only unmatched and face up card to nil
                indexOfOnlyUnmatchedFaceUpCard = nil
            } else {
                // if there are 0 or more face up cards, turn all face down again
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                // then set the index of the only unmatched and face up card to the chosen one
                indexOfOnlyUnmatchedFaceUpCard = chosenIndex
            }
            // finally, make sure the chosen card stays face up
            self.cards[chosenIndex].isFaceUp = true
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
