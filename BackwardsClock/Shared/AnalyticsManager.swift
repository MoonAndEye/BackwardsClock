//
//  AnalyticsManager.swift
//  BackwardsClock (iOS)
//
//  Created by cm0679 on 2022/7/5.
//

import Foundation
import FirebaseAnalytics
// 文件寫，這並不適用 macOS
#if os(iOS)

struct AnalyticsManager {
    
    private static func logEvent(_ name: String, parameters: [String: Any]? = nil) {
        Analytics.logEvent(name, parameters: parameters)
    }
}
// MARK: - 落地時鐘頁的事件
extension AnalyticsManager {
    
    static var shipQuoteButtonDidTap: String {
        "shipQuoteButtonDidTap"
    }
    
    static var counterClockQuoteButtonDidTap: String {
        "counterClockQuoteButtonDidTap"
    }
    
    static var graceHopperWikiPageDidTap: String {
        "graceHopperWikiPageDidTap"
    }
    
    static var settingPageDidTap: String {
        "settingPageDidTap"
    }
    
    static func logShipQuoteButtonDidTap() {
        logEvent(shipQuoteButtonDidTap)
    }
    
    static func logCounterClockQuoteButtonDidTap() {
        logEvent(counterClockQuoteButtonDidTap)
    }
    
    static func logGraceHopperWikiPageDidTap() {
        logEvent(graceHopperWikiPageDidTap)
    }
    
    static func logSettingPageDidTap() {
        logEvent(settingPageDidTap)
    }
}
#endif
