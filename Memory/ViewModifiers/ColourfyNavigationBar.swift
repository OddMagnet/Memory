//
//  ColourfyNavigationBar.swift
//  Memory
//
//  Created by Michael Brünen on 04.07.20.
//  Copyright © 2020 Michael Brünen. All rights reserved.
//

import SwiftUI


extension View {
    func navigationBarColor(_ backgroundColour: Color) -> some View {
        self.modifier(ColourifyNavigationBar(backgroundColour: backgroundColour))
    }
}

struct ColourifyNavigationBar: ViewModifier {
    
    private let backgroundColour: Color
    
    init(backgroundColour: Color) {
        self.backgroundColour = backgroundColour
        
        // configure appearance for a coloured navigation bar
        let colouredAppearance = UINavigationBarAppearance()
        colouredAppearance.configureWithTransparentBackground()
        colouredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        colouredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        // apply it to all possible navigation bar appearance styles
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.standardAppearance = colouredAppearance
        navigationBarAppearance.compactAppearance = colouredAppearance
        navigationBarAppearance.scrollEdgeAppearance = colouredAppearance
        navigationBarAppearance.tintColor = .white
    }
    
    func body(content: Content) -> some View {
        ZStack{
            content
            VStack {
                GeometryReader { geometry in
                    self.backgroundColour
                        .frame(height: geometry.safeAreaInsets.top)
                        .edgesIgnoringSafeArea(.top)
                    Spacer()
                }
            }
        }
    }
}
