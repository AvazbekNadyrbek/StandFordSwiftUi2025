//
//  ContentView.swift
//  StandFordSwiftUi2025
//
//  Created by Авазбек Надырбек уулу on 21.03.25.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["🤗","🤣","🥸","😶‍🌫️","🥸"]
    var body: some View {
        HStack {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(.orange)
        .padding()
    }
}

#Preview {
    ContentView()
}

struct CardView: View {
    
    let content: String
    
    @State var isFaceUp: Bool = true
    
    var body: some View {
        
        let base = Circle()
        
        ZStack {
            if isFaceUp {
                base.fill(.white)
                    .strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            } else {
                base.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}
