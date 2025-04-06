//
//  MemorizeGame.swift
//  StandFordSwiftUi2025
//
//  Created by Авазбек Надырбек уулу on 23.03.25.
//

import Foundation

struct MemorizeGame<CardContent> {
    
    var cards: Array<Card>
    
    func chooseCard(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
    
    
}
