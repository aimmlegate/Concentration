//
//  Themes.swift
//  Concentration
//
//  Created by andew lukin on 25.03.2020.
//  Copyright © 2020 andew lukin. All rights reserved.
//

import Foundation
import UIKit

protocol Theme {
    var emoji: [String] { get }
    var color: UIColor { get }
}

struct spooky: Theme {
    let emoji = ["👻", "🕷", "🕸", "💀", "🎃", "🧟‍♂️"]
    let color = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
}

struct animals: Theme {
    let emoji = ["🐫", "🦧", "🐈", "🐊", "🐢", "🐇"]
    let color = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
}

struct food: Theme {
    let emoji = ["🍏", "🧀", "🌮", "🍖", "🍟", "🍞"]
    let color = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
}

struct sport: Theme {
    let emoji = ["⚽️", "⚾️", "🏓", "⛸", "🏂", "🚴🏻‍♀️"]
    let color = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
}



struct NewTheme {
    let themeSet: [Theme] = [spooky(), animals(), food(), sport()]
    let emoji: [String]
    let color: UIColor
    
    init () {
        guard let randTheme = themeSet.randomElement() else {
            let fallbackTheme = spooky()
            emoji = fallbackTheme.emoji
            color = fallbackTheme.color
            return
        }
        emoji = randTheme.emoji
        color = randTheme.color
    }
}
