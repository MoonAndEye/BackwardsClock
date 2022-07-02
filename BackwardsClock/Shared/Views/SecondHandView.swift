//
//  SecondHandView.swift
//  BackwardsClock
//
//  Created by cm0679 on 2022/5/29.
//

import SwiftUI

struct SecondHandView: View {
    
    @StateObject var themeManager = ThemeManager.shared
    
    var body: some View {
        HandShape(handLength: .second)
            .fill(themeManager.secondHandColor)
    }
}

struct SecondHandView_Previews: PreviewProvider {
    static var previews: some View {
        SecondHandView()
    }
}
