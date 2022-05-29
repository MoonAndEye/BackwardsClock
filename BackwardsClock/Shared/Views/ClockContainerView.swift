//
//  ClockContainerView.swift
//  BackwardsClock
//
//  Created by cm0679 on 2022/5/28.
//

import SwiftUI

struct ClockContainerView: View {
    var body: some View {
        
        ZStack {
            ClockDialView()
            HourHandView()
                .rotationEffect(.radians(Double.pi * 1))
            MinuteHandView()
                .rotationEffect(.radians(Double.pi * 0.45))
            SecondHandView()
        }
        .frame(width: 300, height: 300)
    }
}

struct ClockContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ClockContainerView()
    }
}
