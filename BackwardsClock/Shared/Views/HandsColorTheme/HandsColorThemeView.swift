//
//  ColorPadView.swift
//  BackwardsClock
//
//  Created by cm0679 on 2022/6/17.
//

import SwiftUI

struct HandsColorThemeView: View {
    
    @State private var hourHandColor = ThemeManager.shared.hourHandColor
    @State private var minuteHandColor = ThemeManager.shared.minuteHandColor
    @State private var secondHandColor = ThemeManager.shared.secondHandColor
    
    var body: some View {
        VStack {
            ColorPicker("Hour Hand Color", selection: $hourHandColor)
                .onChange(of: hourHandColor) { newValue in
                    ThemeManager.shared.hourHandColor = newValue
                }
                .padding(.top, 50)
            ColorPicker("Minute Hand Color", selection: $minuteHandColor)
                .onChange(of: minuteHandColor) { newValue in
                    ThemeManager.shared.minuteHandColor = newValue
                }
            ColorPicker("Second Hand Color", selection: $secondHandColor)
                .onChange(of: secondHandColor) { newValue in
                    ThemeManager.shared.secondHandColor = newValue
                }
            Spacer()
        }
        .padding()
    }
}

struct ColorPadView_Previews: PreviewProvider {
    
    static var previewTtiel = "Foo"
    
    static var previews: some View {
        HandsColorThemeView()
    }
}
