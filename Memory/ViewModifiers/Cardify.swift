//
//  Cardify.swift
//  Memory
//
//  Created by Michael Brünen on 04.07.20.
//  Copyright © 2020 Michael Brünen. All rights reserved.
//

import SwiftUI

struct Cardify: AnimatableModifier {
    var animatableData: Double {
        get { return rotation }
        set { rotation = newValue }
    }
    var rotation: Double
    var isFaceUp: Bool {
        rotation < 90   // face up when less than 90 degrees, otherwise face up
    }
    
    init(isFaceUp: Bool) {  // set rotation based on bool value, enabling 3d rotation effect
        rotation = isFaceUp ? 0 : 180
    }
    
    func body(content: Content) -> some View {
        ZStack {
            // use opacity instead of if/else so hidden views can be animated too
            Group {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(lineWidth: edgeLineWidth)
                content
            }
            .opacity(isFaceUp ? 1 : 0)
            
            Group {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill()
            }
            .opacity(isFaceUp ? 0 : 1)
            
        }
        .rotation3DEffect(.degrees(rotation), axis: (x:0, y: 1, z: 0))
    }
    
    // MARK: - Drawing Constants
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 3
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
