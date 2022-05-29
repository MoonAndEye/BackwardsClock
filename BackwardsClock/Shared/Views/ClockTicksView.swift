//
//  ClockTickShape.swift
//  BackwardsClock
//
//  Created by cm0679 on 2022/5/29.
//

import SwiftUI

// inspired from Phan Viết Trung
//https://medium.com/dwarves-foundation/draw-watch-face-using-swiftui-a863ad347b2c
struct Tick: Shape {
    
    var tickLength: CGFloat
    
    func path(in rect: CGRect) -> Path {
        
        var p = Path()
        p.move(to: CGPoint(x: rect.midX, y: rect.minY))
        p.addLine(to: CGPoint(x: rect.midX, y: rect.minY + tickLength))
        
        return p
    }
}

struct ClockTicksView: View {
    
    var tickLength: CGFloat
    
    var body: some View {
        
        ZStack {
            
            ForEach(0..<60) { position in
                
                if position % 5 == 0 {
                    Tick(tickLength: tickLength)
                        .stroke(lineWidth: 3)
                        .rotationEffect(.radians(Double.pi * 2 / 60 * Double(position)))
                }
            }
        }
        .padding()
    }
}

struct ClockTicksView_Previews: PreviewProvider {
    static var previews: some View {
        ClockTicksView(tickLength: 5)
            .previewLayout(.sizeThatFits)
    }
}
