//
//  DrawArc.swift
//  BackwardsClock
//
//  Created by cm0679 on 2022/6/3.
//

import SwiftUI

struct DrawArc: Shape {
    func path(in rect: CGRect) -> Path {
        var p = Path()
        
        let center = CGPoint(x: rect.midX, y: rect.midY)
        p.move(to: center)
        p.addArc(center: center, radius: 50, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
        
        return p
    }
}

struct DrawArcV2: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        var p = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        p.move(to: center)
        p.addArc(center: center, radius: 50, startAngle: Angle(degrees: 270), endAngle: Angle(degrees: 0), clockwise: false)
        return p
    }
}

struct DrawArc_Previews: PreviewProvider {
    static var previews: some View {
        DrawArcV2()
            .stroke(lineWidth: 3)
            .frame(width: 200, height: 200, alignment: .center)
            .previewLayout(.sizeThatFits)
    }
}
