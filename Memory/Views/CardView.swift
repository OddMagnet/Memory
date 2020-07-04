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
    @State private var animatedBonusRemaining: Double = 0
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        // only show a card when it's either face up or unmatched
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Group { // bonus time shown as a "pie chart"
                    if card.isConsumingBonusTime {
                        PieView(startAngle: .degrees(0 - angleOffset),
                                endAngle: .degrees(-animatedBonusRemaining * 360 - angleOffset))
                            .onAppear(perform: startBonusTimeAnimation)
                    } else {
                        PieView(startAngle: .degrees(0 - angleOffset),
                                endAngle: .degrees(-card.bonusRemaining * 360 - angleOffset))
                    }
                }
                .opacity(pieOpacity)
                .padding(piePadding)
                .transition(.scale)

                Text(card.content)
                    .font(Font.system(size: fontSize(for: size)))
                    .rotationEffect(.degrees(card.isMatched ? 360 : 0))
                    .animation(card.isMatched
                        ? Animation.linear(duration: spinDuration).repeatForever(autoreverses: false)
                        : .default
                    )
            }
            .cardify(isFaceUp: card.isFaceUp)
            .transition(.scale)
        }
    }
    
    private func startBonusTimeAnimation() {
        animatedBonusRemaining = card.bonusRemaining
        withAnimation(.linear(duration: card.bonusTimeRemaining)) {
            animatedBonusRemaining = 0
        }
    }
    
    // MARK: - Drawing constants
    private let fontScaling: CGFloat = 0.75
    private let angleOffset: Double = 90
    private let piePadding: CGFloat = 5
    private let pieOpacity: Double = 0.5
    private let spinDuration: Double = 0.8
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontScaling
    }
    
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: MemoryGame<String>.Card(isFaceUp: true, isMatched: false, content: "🎓", id: 1))
    }
}
