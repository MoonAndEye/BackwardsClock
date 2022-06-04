//
//  ClockContainerView.swift
//  BackwardsClock
//
//  Created by cm0679 on 2022/5/28.
//

import SwiftUI
import Combine

struct ClockContainerView: View {

    @StateObject var clockwork: Clockwork = .init()
    
    var body: some View {
        VStack {
            ZStack {
                ClockDialView()
                HourHandView()
                    .rotationEffect(Angle(radians: clockwork.hourAngle))
                MinuteHandView()
                    .rotationEffect(Angle(radians: clockwork.minuteAngle))
                SecondHandView()
                    .rotationEffect(Angle(radians: clockwork.secondAngle))
            }
            .aspectRatio(1, contentMode: .fit)
            
            Button("Start timer") {
                clockwork.startTimer()
            }

            Button("Stop timer") {
                clockwork.stopTimer()
            }
        }
    }
}

struct ClockContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ClockContainerView()
    }
}
