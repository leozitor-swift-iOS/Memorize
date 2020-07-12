//
//  MemoryGame.swift
//  Memorize
//
//  Created by Leozítor Floro on 25/06/20.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
   private(set) var cards: Array<Card>
    var score: Int
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter{ cards[$0].isFaceUp }.only }
        
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    mutating func choose(card: Card) {
        print("card chosen: \(card)")
        if let chosenIndex: Int = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                }else{
                    if cards[chosenIndex].alreadySeen == true {
                        score -= 1
                    }
                    if cards[potentialMatchIndex].alreadySeen == true {
                        score -= 1
                    }
                }
                cards[chosenIndex].isFaceUp = true
                cards[chosenIndex].alreadySeen = true
                cards[potentialMatchIndex].alreadySeen = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        cards = cards.shuffled()
        score = 0
    }
    
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        var alreadySeen = false
        var content: CardContent
        var id: Int
    }
}
