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
    
    var indexOfOneAndOnlyFaceUpCard: Int?
//
//    func chooseCard(at index: Int) {
//        if !cards[index].isMatched {
//            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
//                if cards[matchIndex].id == cards[index].id {
//                    cards[matchIndex].isMatched = true
//                    cards[index].isMatched = true
//                }
//                cards[index].isFaceUp = true
//                indexOfOneAndOnlyFaceUpCard = nil
//            } else {
//                for flipDownind in cards.indices {
//                    cards[flipDownind].isFaceUp = false
//                }
//                cards[index].isFaceUp =  true
//                indexOfOneAndOnlyFaceUpCard = index
//            }
//        }
//    }
//
    func chooseCard(at index: Int) {
        let card = cards[index]
        
        switch card.cardState {
        case .Close:
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
        
            for flipDownind in cards.indices {
                cards[flipDownind].cardState = .Close
            }
            
            cards[index].cardState = .Open
            
            
        default:
            return
        }
        
    }
    
    
    init(numberOfPairsOfCard: Int) {
        for _ in 0...numberOfPairsOfCard {
            let card = Card()
            cards += [card, card]
        }
        // TODO: Shuffle card
    }
    
}
