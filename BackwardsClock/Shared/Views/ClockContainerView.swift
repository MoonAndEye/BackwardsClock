//
//  ClockContainerView.swift
//  BackwardsClock
//
//  Created by cm0679 on 2022/5/28.
//

import SwiftUI
import Combine

struct ClockContainerView: View {

    @StateObject var movement: Movement = .init()
    
    var body: some View {
        
        ZStack {
            ClockDialView()
            HourHandView()
                .rotationEffect(movement.hourAngle)
            MinuteHandView()
                .rotationEffect(movement.minuteAngle)
            SecondHandView()
                .rotationEffect(movement.secondAngle)
        }
        .frame(width: 300, height: 300)
    }
}

struct ClockContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ClockContainerView()
    }
}
