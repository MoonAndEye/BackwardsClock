//
//  ColorPadView.swift
//  BackwardsClock
//
//  Created by cm0679 on 2022/6/17.
//

import SwiftUI

struct HandsColorThemeView: View {
    
    @State private var secondHandColor = Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)
    
    @State private var minuteHandColor = Color(.sRGB, red: 0, green: 0, blue: 0)
    
    @State private var hourHandColor = Color(.sRGB, red: 0, green: 0, blue: 0)
    
    var body: some View {
        VStack {
            ColorPicker("Second Hand Color", selection: $secondHandColor)
                .onChange(of: secondHandColor) { newValue in
                    // TODO: - set in UserDefaults
                }
                .padding(.top, 50)
            ColorPicker("Minute Hand Color", selection: $minuteHandColor)
                .onChange(of: secondHandColor) { newValue in
                    // TODO: - set in UserDefaults
                }
            ColorPicker("Hour Hand Color", selection: $hourHandColor)
                .onChange(of: secondHandColor) { newValue in
                    // TODO: - set in UserDefaults
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
