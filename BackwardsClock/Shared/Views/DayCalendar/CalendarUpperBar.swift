//
//  CalendarUpperBar.swift
//  BackwardsClock
//
//  Created by cm0679 on 2022/6/3.
//

import SwiftUI

struct CalendarUpperBar: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        var p = Path()
        let radius = rect.height / 3
        let leftArcCenter = CGPoint(x: radius, y: radius)
        let rightArcCenter = CGPoint(x: rect.width - radius, y: radius)
        
        let leftUpPoint = CGPoint(x: radius, y: 0)
        let rightUpPoint = CGPoint(x: rect.width - radius, y: 0)
        
        let rightDownCorner = CGPoint(x: rect.width, y: rect.height)
        let leftDownCorner = CGPoint(x: 0, y: rect.height)
        let leftEdgePoint = CGPoint(x: 0, y: radius)
//        p.addArc(center: leftArcCenter, radius: radius, startAngle: Angle(degrees: 270), endAngle: Angle(degrees: 360), clockwise: true)
            
        
        p.move(to: leftUpPoint)
        p.addLine(to: rightUpPoint)
        p.addArc(center: rightArcCenter, radius: radius, startAngle: Angle(degrees: 270), endAngle: Angle(degrees: 0), clockwise: false)
        p.addLine(to: rightDownCorner)
        p.addLine(to: leftDownCorner)
        p.addLine(to: leftEdgePoint)
        p.addArc(center: leftArcCenter, radius: radius, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
        
        
//        p.closeSubpath()
        
        return p
    }
}

struct CalendarUpperBarV2: Shape {
    func path(in rect: CGRect) -> Path {
        
        let barHeight = rect.size.height * 0.25
        let radius = barHeight * 0.3333
        
        let leftEdgePoint: CGPoint = .init(x: 0, y: radius)
        let rightUpPoint = CGPoint(x: rect.width - radius, y: 0)

        let leftArcCenter = CGPoint(x: radius, y: radius)
        let rightArcCenter = CGPoint(x: rect.width - radius, y: radius)
        
        let rightDownCorner: CGPoint = .init(x: rect.width, y: barHeight)
        let leftDownCorner: CGPoint = .init(x: 0, y: barHeight)
        
        var p = Path()
        p.move(to: leftEdgePoint)
        p.addArc(center: leftArcCenter, radius: radius, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
        p.addLine(to: rightUpPoint)
        p.addArc(center: rightArcCenter, radius: radius, startAngle: Angle(degrees: 270), endAngle: Angle(degrees: 0), clockwise: false)
        p.addLine(to: rightDownCorner)
        p.addLine(to: leftDownCorner)
        p.closeSubpath()
        
        return p
    }
}

struct CalendarUpperBarContainer: View {
    
    let month: String
    
    var body: some View {
        
        ZStack {
            CalendarUpperBarV2()
                .fill(.red)

            GeometryReader { geo in
                
                Text("\(month)")
                    .foregroundColor(.white)
                    .font(.system(size: 100, weight: .semibold, design: .default))
                    .minimumScaleFactor(0.1)
                    .multilineTextAlignment(.center)
                    .frame(width: geo.size.width, height: geo.size.height * 0.25, alignment: .center)
            }
        }
    }
}

struct CalendarUpperBar_Previews: PreviewProvider {
    static var previews: some View {
        
//        CalendarUpperBarV2()
//            .fill(.red)
//            .frame(width: 200, height: 200, alignment: .center)
//            .background(.green)
//            .previewLayout(.sizeThatFits)
        
        CalendarUpperBarContainer(month: "July")
            .aspectRatio(1.0, contentMode: .fit)
            .padding()
    }
}
