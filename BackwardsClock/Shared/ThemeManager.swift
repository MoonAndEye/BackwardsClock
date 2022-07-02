//
//  ThemeManager.swift
//  BackwardsClock
//
//  Created by cm0679 on 2022/7/2.
//

import Foundation
/// Color settings to hands. Users can adjust from setting page view
class ThemeManager {
    
    static let shared = ThemeManager()
    
    private init() {}
    
    private var userDefaults: UserDefaults {
        return UserDefaults.standard
    }
}
