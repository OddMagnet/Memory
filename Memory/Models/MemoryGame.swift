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
    
    private(set) var cards: [Card]
    private(set) var theme: Theme
    private(set) var score = 0
    private var seenCards = Set<Int>()
    
    private var indexOfOnlyFaceUpCard: Int? {
        // on get return the index of the only face up card or nil if multiple
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
        // on set, only keep the card with the new index face up
        set {
            for index in cards.indices {
                // turn all cards face down, aside from the newly selected
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    mutating func choose(_ card: Card) {
        // only act on cards that have an existing index, are not face up and are not already matched
        if let chosenIndex = cards.index(of: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            // if there is a face up card
            if let potentialMatchIndex = indexOfOnlyFaceUpCard {
                // check if they are the same card (have the same content)
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    // a match happened
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    // add score
                    score += 2
                } else {
                    // no match happened, if seen already subtract from score
                    if seenCards.contains(cards[chosenIndex].id)
                        || seenCards.contains(cards[potentialMatchIndex].id) {
                        score -= 1
                    } else { // else add them to the set of seen cards
                        seenCards.insert(cards[chosenIndex].id)
                        seenCards.insert(cards[potentialMatchIndex].id)
                    }
                }
                // make sure the just chose card stays face up
                self.cards[chosenIndex].isFaceUp = true
            } else {
                // set the index of the only face up card to the chosen one
                // automatically turns all others down
                indexOfOnlyFaceUpCard = chosenIndex
            }
        }
    }
        
    init(theme: Theme, cardContentFactory: (Int) -> CardContent) {
        cards = [Card]()
        self.theme = theme

        // if theme has a prefered number of pairs, use that, else random
        let numberOfPairs = theme.numberOfPairsToShow ?? Int.random(in: 2...5)
        
        for pairIndex in 0 ..< numberOfPairs {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))      // calculate id based on pairIndex
            cards.append(Card(content: content, id: pairIndex * 2 + 1))  // this ensures a unique id
        }
        
        cards.shuffle()
    }
}
