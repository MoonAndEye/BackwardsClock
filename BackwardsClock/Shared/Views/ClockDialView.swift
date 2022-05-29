//
//  ClockDialView.swift
//  BackwardsClock
//
//  Created by cm0679 on 2022/5/29.
//

import SwiftUI

struct ClockDialView: View {
    
    var body: some View {
        ZStack {
            ArcView()
            ClockTicksView(tickLength: 8)
            BackwardsClockNumbers()
        }
    }
}

struct ClockDialView_Previews: PreviewProvider {
    static var previews: some View {
        ClockDialView()
            .frame(width: 300, height: 300, alignment: .center)
    }
}
