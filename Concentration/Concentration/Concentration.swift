//
//  Concentration.swift
//  Concentration
//
//  Created by Lily Schwarz on 6/6/19.
//  Copyright © 2019 Lily Schwarz. All rights reserved.
//

import Foundation

class Concentration {
    
    private (set) var cards =  Array<Card>()
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices{
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
            
        }
        set{
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int){
        assert(cards.indices.contains(index), "Concentration.chooseCart(at: \(index)): chosen index not in the cards")
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                //check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
               // either no cards or 2 cards are face up

                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int){
        assert(numberOfPairsOfCards > 0, "Concentration.init: \(numberOfPairsOfCards)): you must have at least one pair of cards")
        for _ in 1...numberOfPairsOfCards{
            let card = Card()
            cards.append(card) //card
            cards.append(card) //matching card
            //this also works to add a card and a matching card to an array:
            //cards += [card, card]
        }
        
        // TODO: Shuffle the cards
    }
}
