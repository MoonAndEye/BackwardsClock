//
//  HourHandView.swift
//  BackwardsClock
//
//  Created by cm0679 on 2022/5/29.
//

import SwiftUI

struct HourHandView: View {
    var body: some View {
        HandShape(handLength: .hour)
            .fill(BCColor.hourHandColor)
    }
}

struct HourHandView_Previews: PreviewProvider {
    static var previews: some View {
        HourHandView()
    }
}
