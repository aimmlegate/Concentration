//
//  ViewController.swift
//  Concentration
//
//  Created by andew lukin on 06.03.2020.
//  Copyright © 2020 andew lukin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsOfCard: (cardButtons.count + 1) / 2)
    
    var theme = NewTheme()
    
    lazy var emojiChoices = theme.emoji
    
    lazy var color = theme.color
    
    var flipCount = 0 {
        didSet {
             flips.text = "Flips: \(flipCount)"
        }
    }
    
    var scoreCount = 0 {
        didSet {
             scoreView.text = "Score: \(scoreCount)"
        }
    }
    
    var emoji = [Int: String]()
    
    @IBOutlet weak var flips: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var scoreView: UILabel!
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Wrong card")
        }
    }
    @IBAction func newGame(_ sender: UIButton) {
        startNewGame()
    }
    
    func updateViewFromModel() {
        flipCount = game.flipCount
        scoreCount = game.score
        for index in cardButtons.indices {
    
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.cardState == .Open {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.cardState == .Matched ?  #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 0) : theme.color
            }
        }
    }
    
    func emoji(for card: Card) -> String {
        if emoji[card.id] == nil {
            guard let rand = emojiChoices.randomElement() else {
                return "?!"
            }
            emojiChoices = emojiChoices.filter({ (a: String) -> Bool in
                a != rand
            })
            emoji[card.id] = rand
        }
        return emoji[card.id] ?? "??"
    }
    
    func startNewGame() {
        game = Concentration(numberOfPairsOfCard: (cardButtons.count + 1) / 2)
        theme = NewTheme()
        emojiChoices = theme.emoji
        color = theme.color
        flipCount = game.flipCount
        updateViewFromModel()
    }
    
}

