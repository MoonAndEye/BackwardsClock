//
//  CalendarMetalRing.swift
//  BackwardsClock
//
//  Created by cm0679 on 2022/6/3.
//

import SwiftUI

struct CalendarMetalRing: View {
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Circle()
                    .trim(from: 0.15, to: 1.0)
                    .stroke(BCColor.calendarMetalRingHole, lineWidth: 10)
                    .rotationEffect(Angle(degrees: 245))
                    .frame(width: 40, height: 40, alignment: .center)
                    .padding(.bottom, 5)
            }
            
            Capsule()
                .fill(BCColor.calendarMetal)
                .padding(10)
        }
    }
}

struct CalendarMetalRing_Previews: PreviewProvider {
    static var previews: some View {
//        CalendarMetalRingSahpe()
//            .fill(.red)
//            .frame(width: 200, height: 200, alignment: .center)
//            .background(.green)
//            .previewLayout(.sizeThatFits)
        
        CalendarMetalRing()
            .frame(width: 50, height: 100, alignment: .center)
            .previewLayout(.sizeThatFits)
    }
}
