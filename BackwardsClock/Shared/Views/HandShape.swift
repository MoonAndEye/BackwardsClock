//
//  HandShape.swift
//  BackwardsClock
//
//  Created by cm0679 on 2022/5/29.
//

import SwiftUI

enum HandLength: Double {

    case second = 1
    case minute = 0.95
    case hour = 0.627
}

struct HandShape: Shape {
    
    var spacing: CGFloat
    
    var handLength: HandLength
    
    func path(in rect: CGRect) -> Path {
        
        var p = Path()

        p.move(to: CGPoint(x: rect.midX - spacing, y: rect.midY))
        p.addLine(to: CGPoint(x: rect.midX, y: getHandPointY(rect: rect, handLength: handLength)))
        p.addLine(to: CGPoint(x: rect.midX + spacing, y: rect.midY))
        
        return p
    }
    
    func getHandPointY(rect: CGRect, handLength: HandLength) -> CGFloat {
        
        return rect.midY * ( 1 - handLength.rawValue)
    }
}
struct HandShape_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            HandShape(spacing: 2, handLength: .second)
                .fill(BCColor.secondHandColor)
                .frame(width: 200, height: 200, alignment: .center)
                .background(.cyan)
            HandShape(spacing: 2, handLength: .minute)
                .fill(BCColor.minuteHandColor)
                .frame(width: 200, height: 200, alignment: .center)
                .background(.cyan)
            HandShape(spacing: 2, handLength: .hour)
                .fill(BCColor.hourHandColor)
                .frame(width: 200, height: 200, alignment: .center)
                .background(.cyan)
        }
        .previewLayout(.sizeThatFits)
    }
}
