//
//  Concentration.swift
//  Concentration
//
//  Created by andew lukin on 09.03.2020.
//  Copyright © 2020 andew lukin. All rights reserved.
//

import Foundation


class Concentration {
    
    var cards = [Card]()
    
    var flipCount: Int
    
    var score: Int
    
    var seenCards: Set<Int>
    
    var indexOfOneAndOnlyFaceUpCard: Int?

    func chooseCard(at index: Int) {
        let card = cards[index]
        
        switch card.cardState {
        case .Close:
            flipCount += 1
            checkAndCalcScore(for: index)
            if card.id == indexOfOneAndOnlyFaceUpCard {
                cards = cards.map({ (c: Card) -> Card in
                    if (c.id == indexOfOneAndOnlyFaceUpCard) {
                        var n = c
                        n.cardState = .Matched
                        return n
                    }
                    return c
                })
                indexOfOneAndOnlyFaceUpCard = nil
                addScore()
                return
            }
            indexOfOneAndOnlyFaceUpCard = card.id
            
            
            
            cards = cards.map({ (c: Card) -> Card in
                switch c.cardState {
                case .Open:
                    var newCard = c
                    newCard.cardState = .Close
                    return newCard
                default:
                    return c
                }
            })
            
            cards[index].cardState = .Open
        
        default:
            return
        }
        
    }
    
    func checkAndCalcScore(for index: Int) {
        if (seenCards.contains(index)) {
            score -= 1
        }
        seenCards.insert(index)
    }
    
    
    func addScore() {
        score += 2
    }
    
    
    init(numberOfPairsOfCard: Int) {
        for _ in 1...numberOfPairsOfCard {
            let card = Card()
            cards += [card, card]
        }
        print(cards.map({(c: Card) -> Int in c.id}))
        cards.shuffle()
        print(cards.map({(c: Card) -> Int in c.id}))
        flipCount = 0
        score = 0
        seenCards = []
    }
    
}
