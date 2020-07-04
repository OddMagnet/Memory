//
//  PieView.swift
//  Memory
//
//  Created by Michael Brünen on 04.07.20.
//  Copyright © 2020 Michael Brünen. All rights reserved.
//

import SwiftUI

struct PieView: Shape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool = true
    
    func path(in rect: CGRect) -> Path {
        let radius = min(rect.width, rect.height) / 2
        let center = CGPoint(x: rect.midX, y: rect.midY)
//        let start = CGPoint(
//            x: center.x + radius * cos(CGFloat(startAngle.radians)),
//            y: center.y + radius * sin(CGFloat(startAngle.radians))
//        )
        
        var path = Path()
        path.move(to: center)
        //path.addLine(to: start)
        path.addArc(
            center: center,
            radius: radius,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: clockwise
        )
        //path.addLine(to: center)
        return path
    }
    
}
