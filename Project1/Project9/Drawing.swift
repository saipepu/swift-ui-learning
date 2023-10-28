//
//  Drawing.swift
//  Project1
//
//  Created by Sai Pe Pu on 26/10/2566 BE.
//

import SwiftUI

struct Drawing: View {
    
    var body: some View {
        VStack {
            Arc(startAngle: .degrees(0), endAngle: .degrees(100), clockwise: true)
                .strokeBorder(.blue, lineWidth: 10)
                .frame(width: 300, height: 300)
            Circle()
                .strokeBorder(.blue, lineWidth: 40)
        }
    }
    
    struct Arc: Shape, InsettableShape {
        var startAngle: Angle
        var endAngle: Angle
        var clockwise: Bool
        var insetAmount = 0.0
        
        func path(in rect: CGRect) -> Path {
            let rotationAdjustment = Angle.degrees(90)
            let modifiedStart = startAngle - rotationAdjustment
            let modifiedEnd = endAngle - rotationAdjustment
            
            var path = Path()
            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
            
            return path
        }
        
        func inset(by amount: CGFloat) -> some InsettableShape {
            var arc = self
            arc.insetAmount += amount
            
            return arc
        }
    }
}

struct Drawing_Preview: PreviewProvider {
    
    static var previews: some View {
        Drawing()
    }
}
