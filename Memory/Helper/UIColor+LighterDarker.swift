//
//  UIColor+LighterDarker.swift
//  Memory
//
//  Created by Michael Brünen on 04.07.20.
//  Copyright © 2020 Michael Brünen. All rights reserved.
//

import SwiftUI

extension UIColor {
    
    // make color a bit lighter
    func lighterBy(_ amount: CGFloat = 0.25) -> UIColor {
        mixWithColour(.white, amount: amount)
    }
    
    // make color a bit darker
    func darkerBy(_ amount: CGFloat = 0.25) ->UIColor {
        mixWithColour(.black, amount: amount)
    }
    
    // mix self with another color
    func mixWithColour(_ color: UIColor, amount: CGFloat = 0.25) -> UIColor {
        // placeholder variables
        var r1: CGFloat = 0, g1: CGFloat = 0, b1: CGFloat = 0, alpha1: CGFloat = 0  // for self
        var r2: CGFloat = 0, g2: CGFloat = 0, b2: CGFloat = 0, alpha2: CGFloat = 0  // for color to mix with
        
        // get rgb values from self, put them in first placeholder variables
        self.getRed(&r1, green: &g1, blue: &b1, alpha: &alpha1)
        // get rgb values from the colour to mix with, put them in second placeholder variables
        color.getRed(&r2, green: &g2, blue: &b2, alpha: &alpha2)
        
        // helper function, reduces originalColour by the specified amount and adds the specified amount of mixColour to it
        let mix: (CGFloat, CGFloat) -> CGFloat = { (originalColour, mixColour) in
            originalColour * (1.0 - amount ) + mixColour * amount
        }
        
        // return a UIColor based on the mixed rgba values
        return UIColor(red: mix(r1, r2),
                       green: mix(g1, g2),
                       blue: mix(b1, b2),
                       alpha: alpha1)
    }
}
