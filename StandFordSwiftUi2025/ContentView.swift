//
//  ContentView.swift
//  StandFordSwiftUi2025
//
//  Created by Авазбек Надырбек уулу on 21.03.25.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["🤗","🤣","🥸","😶‍🌫️","🥸","🗿", "🥑","🍠","🙊","🐤","🐁"]
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            ScrollView {
            cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding(EdgeInsets.init(top: 0, leading: 20, bottom: 20, trailing: 20))
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardShuffler
        }
        .imageScale(.large)
        .font(.title)
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
            }
            .aspectRatio( 2/3 ,contentMode: .fit)
        }
        .foregroundColor(.orange)
        .padding()
    }
    
    func cardCountAdjuster (by offset: Int, symbol: String) -> some View {
        Button {
            cardCount += offset
            
        } label: {
            Image(systemName: symbol)
        }
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View {
        return cardCountAdjuster(by: -1, symbol: "folder.badge.minus")
    }
    
    var cardShuffler: some View {
        return cardCountAdjuster(by: +1, symbol: "folder.badge.plus")
    }
}

#Preview {
    ContentView()
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
