//
//  ViewController.swift
//  Concentration
//
//  Created by Lily Schwarz on 6/6/19.
//  Copyright © 2019 Lily Schwarz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)

    var numberOfPairsOfCards: Int {
        get {
            return ((cardButtons.count+1)/2)
        }
        
    }
    
    private (set) var flipCount = 0 {
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    @IBOutlet private var cardButtons: [UIButton]!

   

    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chosen card was not in cardButtons")
        }
    }
    func updateViewFromModel(){
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0): #colorLiteral(red: 0.8105085071, green: 0.9389572539, blue: 0.3196947039, alpha: 1)
            }
        }
    }
    private var emojiChoices = ["🐸","🦆", "🐠","🐬","🍄","🦑", "🦛", "🍕", "🌮", "🍣", "🐊", "🦀","💻", "🐮", "🦎", "🐼", "🐤", "🦖"]
    
    private var emoji = Dictionary<Int, String>()
    
    private func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count>0{
                let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
                emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
    
}

