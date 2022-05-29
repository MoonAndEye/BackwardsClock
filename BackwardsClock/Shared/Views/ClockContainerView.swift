//
//  ClockContainerView.swift
//  BackwardsClock
//
//  Created by cm0679 on 2022/5/28.
//

import SwiftUI

struct ClockContainerView: View {
    var body: some View {
        // Backgorund // 1 ~ 12
        // HourHandView
        // MinuteHandView()
        SecondHandView()
    }
}

struct ClockContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ClockContainerView()
    }
}
