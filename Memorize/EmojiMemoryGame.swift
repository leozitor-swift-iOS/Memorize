//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Leozítor Floro on 25/06/20.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let allEmojis : Array<String> = ["👻","🕷", "🎃", "🚘", "🎲", "💩", "💀", "👺", "👹", "👿", "☠️", "👽", "👾", "🤖", "👁", "💄", "🧛‍♀️", "🧳", "🎒", "👜", "🍩", "🎂", "🍰"]
        var emojis = Array<String>()
        for _ in 1...Int.random(in: 2...5) { emojis.append(allEmojis.randomElement()!)}
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

