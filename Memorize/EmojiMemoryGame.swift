//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Leozítor Floro on 25/06/20.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: (theme: Theme, memoryGame: MemoryGame<String>) = EmojiMemoryGame.createMemoryGame()
    static var theme: Theme?
    
    static var themes = [
        Theme(name: "Faces", emojis: ["😍", "🤩", "🥺", "🤓", "😎", "🥴", "😳", "🤠", "🥶"], numberOfPairsOfCards: nil, color: Color.orange),
        Theme(name: "Flags", emojis: ["🇧🇷", "🇺🇸","🇯🇵", "🇹🇯", "🇨🇮", "🇧🇪", "🇮🇸", "🇨🇦", "🇮🇳", "🇰🇷", "🇧🇾"], numberOfPairsOfCards: 4, color: Color.gray),
        Theme(name: "Animals", emojis: ["🐶", "🐱", "🐭", "🐹", "🐰", "🐻", "🐼", "🐨", "🐯", "🦁"], numberOfPairsOfCards: 5, color: Color.green),
        Theme(name: "Cars", emojis: ["🚔", "🚍", "🚘", "🚖", "🚇"], numberOfPairsOfCards: nil, color: Color.blue),
        Theme(name: "Balls", emojis: ["⚽", "🏀", "🏈", "⚾", "🥎", "🎾", "🏐", "🏉", "🎱"], numberOfPairsOfCards: 3, color: Color.yellow),
        Theme(name: "Fruits", emojis: ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🍈"], numberOfPairsOfCards: nil, color: Color.purple),
    ]
    
    static func createMemoryGame() -> (Theme, MemoryGame<String>) {
        theme = EmojiMemoryGame.themes[Int.random(in: 0..<EmojiMemoryGame.themes.count)]
        let emojis = theme!.emojis.shuffled()
        let game = (theme!, MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            emojis[pairIndex]
        })
        return game
    }
    
    struct Theme {
        var name: String
        var emojis = Array<String>()
        var numberOfPairsOfCards: Int?
        var numberOfPairOfCardsToShow: Int { numberOfPairsOfCards ?? Int.random(in: 2..<emojis.count)}
        var color: Color
    }
    
    // MARK - Acess to the Model
    var cards: Array<MemoryGame<String>.Card> {
        model.memoryGame.cards
    }
    var score: Int {
        model.memoryGame.score
    }
    var theme: Theme {
        model.theme
    }
    
    // MARK - Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        model.memoryGame.choose(card: card)
    }
    func resetGame() {
        model = EmojiMemoryGame.createMemoryGame()
    }

}

struct EmojiMemoryGame_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
