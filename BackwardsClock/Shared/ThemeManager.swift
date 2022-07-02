//
//  ThemeManager.swift
//  BackwardsClock
//
//  Created by cm0679 on 2022/7/2.
//

import SwiftUI
/// Color settings to hands. Users can adjust from setting page view
class ThemeManager: ObservableObject {
    
    @Published var hourHandColor: Color {
        didSet {
            ThemeManager.saveHand(color: self.hourHandColor, hand: .hour)
        }
    }
    
    @Published var minuteHandColor: Color {
        didSet {
            ThemeManager.saveHand(color: self.minuteHandColor, hand: .minute)
        }
    }
    
    @Published var secondHandColor: Color {
        didSet {
            ThemeManager.saveHand(color: self.secondHandColor, hand: .second)
        }
    }
    
    private var userDefaults: UserDefaults {
        return UserDefaults.standard
    }
    
    static let shared = ThemeManager()
    
    private init() {
        self.hourHandColor = ThemeManager.getColor(hand: .hour)
        self.minuteHandColor = ThemeManager.getColor(hand: .minute)
        self.secondHandColor = ThemeManager.getColor(hand: .second)
    }
}
 
// MARK: - 預設值
extension ThemeManager {
    enum Hand: String {
        case hour
        case minute
        case second
        
        func getKey() -> String {
            return "\(self.rawValue)_hand_color"
        }
        
        func defaultColor() -> Color {
            switch self {
            case .hour:
                return ThemeManager.defaultHourHandColor
            case .minute:
                return ThemeManager.defaultMinuteHandColor
            case .second:
                return ThemeManager.defaultSecondHandColor
            }
        }
    }
}

extension ThemeManager {
    
    static var defaultSecondHandColor: Color {
        Color(red: 255 / 255, green: 59 / 255, blue: 48 / 255, opacity: 1.0)
    }
    
    static var defaultMinuteHandColor: Color {
        return .black
    }
    
    static var defaultHourHandColor: Color {
        return .green
    }
}

extension ThemeManager {
    
    static func saveHand(color: Color, hand: ThemeManager.Hand) {
        
        let cgColor: CGColor
        
        #if os(iOS)
        cgColor = UIColor(color).cgColor
        #elseif os(macOS)
        cgColor = NSColor(color).cgColor
        #endif
        
        if let components = cgColor.components {
            UserDefaults.standard.set(components, forKey: hand.getKey())
        }
    }
    ///
    static func getColor(hand: ThemeManager.Hand) -> Color {
        let key = hand.getKey()
        
        guard let color = UserDefaults.standard.array(forKey: key) as? [CGFloat],
              color.indices.contains(3) else {
            let defaultColor = hand.defaultColor()
            saveHand(color: defaultColor, hand: hand)
            return defaultColor
        }
        
        return Color(.sRGB,
                     red: color[0],
                     green: color[1],
                     blue: color[2],
                     opacity: color[3])
    }
}
