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
            ZStack {
                if card.isFaceUp{
                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                    RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                    Text(card.content)
                }else{
                    if !card.isMatched {
                        RoundedRectangle(cornerRadius: cornerRadius).fill()
                    }
                }
            }
            .font(Font.system(size: fontSize(for: geometry.size)))
        }
    }
    
    // MARK: - Drawing Constants
    
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
