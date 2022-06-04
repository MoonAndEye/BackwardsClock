//
//  BCColor.swift
//  BackwardsClock
//
//  Created by cm0679 on 2022/5/29.
//

import SwiftUI

class BCColor {
    
    static var calendarBackground: Color {
        return Color(.init(gray: 0.937, alpha: 1.0))
    }
    
    static var calendarMetal: Color {
        return Color(.init(gray: 0.592, alpha: 1.0))
    }
    
    static var calendarMetalRingHole: Color {
        return Color(.init(gray: 0.86274, alpha: 1.0))
    }
    
    static var secondHandColor: Color {
        return Color(red: 255 / 255, green: 59 / 255, blue: 48 / 255, opacity: 1.0)
    }
    
    static var minuteHandColor: Color {
        return .black
    }
    
    static var hourHandColor: Color {
        return .green
    }
}
