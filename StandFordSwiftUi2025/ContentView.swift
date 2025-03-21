//
//  ContentView.swift
//  StandFordSwiftUi2025
//
//  Created by Авазбек Надырбек уулу on 21.03.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: false)
            CardView()
            CardView(isFaceUp: true)
            CardView(isFaceUp: true)
            
        }
        .foregroundColor(.orange)
        .padding()
    }
}

#Preview {
    ContentView()
}

struct CardView: View {
    
    @State var isFaceUp: Bool = false
    
    var body: some View {
        
        let base = Circle()
        
        ZStack {
            if isFaceUp {
                base.fill(.white)
                    .strokeBorder(lineWidth: 3)
                Text("🤗")
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
