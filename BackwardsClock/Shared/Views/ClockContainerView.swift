//
//  ClockContainerView.swift
//  BackwardsClock
//
//  Created by cm0679 on 2022/5/28.
//

import SwiftUI
import Combine

struct ClockContainerView: View {
    
    private let timer = Timer.publish(every: 0.1, tolerance: nil, on: .main, in: .common).autoconnect()
    
    @State var secondAngle: Angle = .zero
    
    @State var minuteAngle: Angle = .zero
    
    @State var hourAngle: Angle = .zero
    
    private var angleUtility: AngleUtility = .init()
    
    var body: some View {
        
        ZStack {
            ClockDialView()
            HourHandView()
                .rotationEffect(hourAngle)
            MinuteHandView()
                .rotationEffect(minuteAngle)
            SecondHandView()
                .rotationEffect(secondAngle)
        }
        .frame(width: 300, height: 300)
        .onReceive(timer) { value in
            
            print("Timer published value: \(value.timeIntervalSince1970)")
            calculateAngle(from: value.timeIntervalSince1970)
        }
    }
    
    private func calculateAngle(from timeInterval: TimeInterval) {
        
        secondAngle = Angle(radians: angleUtility.getBackwardsSecondHandRadius(from: timeInterval))
        minuteAngle = Angle(radians: angleUtility.getBackwardsMinuteHandRadius(from: timeInterval))
        hourAngle = Angle(radians: angleUtility.getBackwardsHourHandRadius(from: timeInterval))
    }
    
}

struct ClockContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ClockContainerView()
    }
}
