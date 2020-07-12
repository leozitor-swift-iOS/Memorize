//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Leozítor Floro on 25/06/20.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    var body: some View {
        VStack {
            Text(viewModel.theme.name).font(Font.largeTitle.bold()).padding(.top)
            Grid(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    viewModel.choose(card: card)
                }
                .padding(5)
            }
            .padding()
            .foregroundColor(viewModel.theme.color)
            HStack(){
                Text("Score: \(viewModel.score) ")
                    .font(Font.largeTitle.bold()).padding(.leading, 25.0)
                Spacer()
                Button(action: viewModel.resetGame) {
                    Text("New Game").font(Font.title.italic())
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10.0)
                }.padding(.trailing, 25.0)
            }
        }
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched{
            ZStack {
                Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(110-90), clockwise: true)
                    .padding(5).opacity(0.4)
                Text(card.content)
                    .font(Font.system(size: fontSize(for: size)))
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
}

// MARK: - Drawing Constants

private func fontSize(for size: CGSize) -> CGFloat {
    min(size.width, size.height) * 0.7
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(viewModel: game)
    }
}
