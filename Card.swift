//
//  Card.swift
//  Concentration
//
//  Created by andew lukin on 09.03.2020.
//  Copyright © 2020 andew lukin. All rights reserved.
//

import Foundation

enum CardState {
    case Open
    case Close
    case Matched
}

struct Card {
    
    var id: Int
    
    var cardState: CardState = .Close
    
    static var idFact = 0
    
    static func getUniqId() -> Int {
        idFact += 1
        return idFact
    }
    
    init() {
        self.id = Card.getUniqId()
    }
}
