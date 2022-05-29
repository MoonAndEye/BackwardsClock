//
//  SecondHandView.swift
//  BackwardsClock
//
//  Created by cm0679 on 2022/5/29.
//

import SwiftUI

struct SecondHandView: View {
    var body: some View {
        HandShape(spacing: 2, handLength: .second)
            .fill(BCColor.secondHandColor)
    }
}

struct SecondHandView_Previews: PreviewProvider {
    static var previews: some View {
        SecondHandView()
    }
}
