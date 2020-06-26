//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Leozítor Floro on 25/06/20.
//

import SwiftUI

class EmojiMemoryGame {
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
       /* let emojiRanges = [
            0x1F601...0x1F64F
        ]

        for range in emojiRanges {
            for i in range {
                var c = String(UnicodeScalar(i)!)
                print(c)
            }
        } */
        var emojis: Array<String> = ["👻", "🎃","🕷","🎲","🚘"]
        emojis.removeSubrange(Int.random(in: 2...5)..<5)
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            emojis[pairIndex]
        }
    }

    
    // MARK - Acess to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}

