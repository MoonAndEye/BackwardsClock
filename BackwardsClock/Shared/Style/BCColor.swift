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
    
    static var clockContainerBackground: Color {
        return Color(.sRGB, red: 255 / 255, green: 250 / 255, blue: 245 / 255, opacity: 1.0)
    }
}
// MARK: - Launch Screen Quote Message
extension BCColor {
    
    static var launchScreenBackground: Color {
        return Color(.init(gray: 0.9808, alpha: 1.0))
    }
    
    static var launchQuoteRectBackground: Color {
        return Color(.init(gray: 0.9098, alpha: 1.0))
    }
    
    static var launchCounterClockTextColor: Color {
        return Color(red: 61 / 255, green: 50 / 255, blue: 26 / 255)
    }
}
