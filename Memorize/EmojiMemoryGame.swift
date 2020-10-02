//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Leozítor Floro on 25/06/20.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    /*@Published private var model: (theme: Theme, memoryGame: MemoryGame<String>) = EmojiMemoryGame.createMemoryGame() */
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static var themes = [
        Theme(name: "Faces", emojis: ["😍", "🤩", "🥺", "🤓", "😎", "🥴", "😳", "🤠", "🥶"], numberOfPairsOfCards: nil, color: Color.orange),
        Theme(name: "Flags", emojis: ["🇧🇷", "🇺🇸","🇯🇵", "🇹🇯", "🇨🇮", "🇧🇪", "🇮🇸", "🇨🇦", "🇮🇳", "🇰🇷", "🇧🇾"], numberOfPairsOfCards: 4, color: Color.gray),
        Theme(name: "Animals", emojis: ["🐶", "🐱", "🐭", "🐹", "🐰", "🐻", "🐼", "🐨", "🐯", "🦁"], numberOfPairsOfCards: 6, color: Color.green),
        Theme(name: "Cars", emojis: ["🚔", "🚍", "🚘", "🚖", "🚇", "🚆", "🚋", "🚝", "🚂"], numberOfPairsOfCards: nil, color: Color.blue),
        Theme(name: "Balls", emojis: ["⚽", "🏀", "🏈", "⚾", "🥎", "🎾", "🏐", "🏉", "🎱"], numberOfPairsOfCards: 3, color: Color.yellow),
        Theme(name: "Fruits", emojis: ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🍈"], numberOfPairsOfCards: nil, color: Color.purple),
    ]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        let theme = themes[Int.random(in: 0..<EmojiMemoryGame.themes.count)]
        let emojis = theme.emojis.shuffled()
        let game = MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairOfCardsToShow, chosenTheme: theme) { pairIndex in
            emojis[pairIndex]
        }
        return game
    }

    // MARK - Acess to the Model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    var score: Int {
        model.score
    }
    var theme: Theme {
        model.theme
    }
    
    
    // MARK - Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    func resetGame() {
        model = EmojiMemoryGame.createMemoryGame()
    }

}
