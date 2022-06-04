//
//  DateUtility.swift
//  BackwardsClock (iOS)
//
//  Created by cm0679 on 2022/5/29.
//

import Foundation

struct DateUtility {
    
    static let dateFormatter = DateFormatter()
    
    private var calendar: Calendar {
        return Calendar(identifier: .iso8601)
    }
    
    func getSecond(from timeInterval: TimeInterval) -> Int? {
        
        return getDateComponents(from: timeInterval, components: Set([.second])).second
    }
    
    func getMinute(from timeInterval: TimeInterval) -> Int? {
        
        return getDateComponents(from: timeInterval, components: Set([.minute])).minute
    }
    
    func getHour(from timeInterval: TimeInterval) -> Int? {
        return getDateComponents(from: timeInterval, components: Set([.hour])).hour
    }
    
    private func getDateComponents(from timeInterval: TimeInterval, components: Set<Calendar.Component>) -> DateComponents {
        
        let date = Date(timeIntervalSince1970: timeInterval)
        return calendar.dateComponents(components, from: date)
    }
}
// MARK: - Day, Month
extension DateUtility {
    
    func getMonth(from timeInterval: TimeInterval) -> String {
        
        DateUtility.dateFormatter.dateFormat = "MMMM"
        let date = Date(timeIntervalSince1970: timeInterval)
        return DateUtility.dateFormatter.string(from: date)
    }
    
    func getDay(from timeInterval: TimeInterval) -> String {
        
        DateUtility.dateFormatter.dateFormat = "d"
        let date = Date(timeIntervalSince1970: timeInterval)
        return DateUtility.dateFormatter.string(from: date)
    }
}
