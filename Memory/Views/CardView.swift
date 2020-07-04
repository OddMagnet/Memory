//
//  CardView.swift
//  Memory
//
//  Created by Michael Brünen on 16.06.20.
//  Copyright © 2020 Michael Brünen. All rights reserved.
//

import SwiftUI

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                PieView(startAngle: .degrees(0-90), endAngle: .degrees(110-90))
                    .opacity(pieOpacity)
                    .padding(piePadding)
                Text(card.content)
                    .font(Font.system(size: fontSize(for: size)))
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    // MARK: - Drawing constants
    private let fontScaling: CGFloat = 0.75
    private let piePadding: CGFloat = 5
    private let pieOpacity: Double = 0.5
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontScaling
    }
    
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: MemoryGame<String>.Card(isFaceUp: true, isMatched: false, content: "🎓", id: 1))
    }
}
