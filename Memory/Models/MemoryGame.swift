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
        // automatically start/stop consuming bonus time
        var isFaceUp: Bool = false {
            didSet {
                isFaceUp ? startUsingBonusTime() : stopUsingBonusTime()
            }
        }
        // on match the consumation of bonus time only needs to be stopped
        var isMatched: Bool = false {
            didSet {
                stopUsingBonusTime()
            }
        }
        var content: CardContent
        var id: Int
        
        // MARK: - Score bonus points
        // give bonus points when quickly matching cards
        
        // time limit, 0 = no bonus availble for the card
        var bonusTimeLimit: TimeInterval = 8
        
        // how long card has been face up
        private var faceUpTime: TimeInterval {
            if let lastFaceUpDate  = self.lastFaceUpDate {
                return pastFaceUpTime + Date().timeIntervalSince(lastFaceUpDate)
            } else {
                return pastFaceUpTime
            }
        }
        
        // last time card was turned face up (and still is)
        var lastFaceUpDate: Date?
        // total face up time of the card
        var pastFaceUpTime: TimeInterval = 0
        
        // how much bonus time is remaining
        var bonusTimeRemaining: TimeInterval {
            max(0, bonusTimeLimit - faceUpTime)
        }
        
        // percentage of bonus remaining
        var bonusRemaining: Double {
            (bonusTimeLimit > 0 && bonusTimeRemaining > 0) ? bonusTimeRemaining/bonusTimeLimit : 0
        }
        
        // if card was matched while bonus time was available
        var hasEarnedBonus: Bool {
            isMatched && bonusTimeRemaining > 0
        }
        
        // if the card can and should still consume bonus time
        var isConsumingBonusTime: Bool {
            isFaceUp && !isMatched && bonusTimeRemaining > 0
        }
        
        // set lastFaceUpDate when the card is turned face up
        private mutating func startUsingBonusTime() {
            if isConsumingBonusTime, lastFaceUpDate == nil {
                lastFaceUpDate = Date()
            }
        }
        
        // stop consuming bonus time when card is turned face down
        private mutating func stopUsingBonusTime() {
            pastFaceUpTime = faceUpTime
            self.lastFaceUpDate = nil
        }
        
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
                    score += cards[chosenIndex].hasEarnedBonus ? 2 : 1
                    score += cards[potentialMatchIndex].hasEarnedBonus ? 2 : 1
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
        let numberOfPairs = theme.numberOfPairsToShow ?? Int.random(in: 5...10)
        
        for pairIndex in 0 ..< numberOfPairs {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))      // calculate id based on pairIndex
            cards.append(Card(content: content, id: pairIndex * 2 + 1))  // this ensures a unique id
        }
        
        cards.shuffle()
    }
}
