//
//  MinuteHandView.swift
//  BackwardsClock
//
//  Created by cm0679 on 2022/5/29.
//

import SwiftUI

struct MinuteHandView: View {
    
    @StateObject var themeManager = ThemeManager.shared
    
    var body: some View {
        HandShape(handLength: .minute)
            .fill(themeManager.minuteHandColor)
    }
}

struct MinuteHandView_Previews: PreviewProvider {
    static var previews: some View {
        MinuteHandView()
    }
}
