//
//  ContentView.swift
//  StandFordSwiftUi2025
//
//  Created by Авазбек Надырбек уулу on 21.03.25.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    let emojis: [String] = ["🤗","🤣","🥸","😶‍🌫️","🥸","🗿", "🥑","🍠","🙊","🐤","🐁"]
    
    var viewModel: EmojisMemoryGame
    
    
    var body: some View {
            ScrollView {
            cards
            }
        .padding(EdgeInsets.init(top: 0, leading: 20, bottom: 20, trailing: 20))
    }
     
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]) {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
            .aspectRatio( 2/3 ,contentMode: .fit)
        }
        .foregroundColor(.orange)
        .padding()
    }
    
}

#Preview {
    EmojiMemoryGameView()
}

struct CardView: View {
    
    let content: String
    
    @State var isFaceUp: Bool = true
    
    var body: some View {
        
        ZStack {
            let base = RoundedRectangle(cornerRadius: 20)
            
            Group {
                base.fill(.white)
                    .strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill()
                .opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}
