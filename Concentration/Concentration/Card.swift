//
//  Card.swift
//  Concentration
//
//  Created by Lily Schwarz on 6/6/19.
//  Copyright © 2019 Lily Schwarz. All rights reserved.
//

import Foundation


struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    private static var identifierFactory = 0
    
    
    private static func getUniqueIdentier() -> Int{
        identifierFactory += 1
        return identifierFactory
    }
    
    init(){
        self.identifier = Card.getUniqueIdentier()
    }
}
