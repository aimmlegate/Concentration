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
    
    var flipCount = 0 {
        didSet {
             flips.text = "Flips: \(flipCount)"
        }
    }
    
    var emojiChoices = ["🎃","👻","🕸","🕷","🌚","🌿","🛢"]
    
    var emoji = [Int: String]()
    
    @IBOutlet weak var flips: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
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
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.cardState == .Open {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.cardState == .Matched ?  #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 0) : #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            }
        }
    }
    
    func emoji(for card: Card) -> String {
        if emoji[card.id] == nil {
            let randInd = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.id] = emojiChoices.remove(at: randInd)
        }
        return emoji[card.id] ?? "?"
    }
    
    func startNewGame() {
        game = Concentration(numberOfPairsOfCard: (cardButtons.count + 1) / 2)
        emojiChoices = ["🎃","👻","🕸","🕷","🌚","🌿","🛢"]
        flipCount = 0
        updateViewFromModel()
    }
    
}

