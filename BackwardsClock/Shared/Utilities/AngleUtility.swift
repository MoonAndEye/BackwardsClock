//
//  AngleUtility.swift
//  BackwardsClock
//
//  Created by cm0679 on 2022/5/29.
//

import Foundation

/// Convert time to hands angle
struct AngleUtility {
    
    private let secondToMinute: Double = 60
    
    private let minuteToHour: Double = 60
    
    private let hourToOneCircle: Int = 12
    
    private var dateUtility: DateUtility {
        return DateUtility()
    }
    
    func getSecondHandRadius(from timeInterval: TimeInterval) -> Double {
        
        guard let second = dateUtility.getSecond(from: timeInterval) else {
            return 0
        }
        
        return (Double(second) / secondToMinute) * Double.pi * 2
    }
    
    func getMinuteHandRadius(from timeInterval: TimeInterval) -> Double {
        
        guard let minute = dateUtility.getMinute(from: timeInterval) else {
                  return 0
              }
        
        return (Double(minute) / minuteToHour) * Double.pi * 2
    }
    
    func getHourHandRadius(from timeInterval: TimeInterval) -> Double {
        
        guard let hour = dateUtility.getHour(from: timeInterval),
              let minute = dateUtility.getMinute(from: timeInterval) else {
                  return 0
              }
        
        let hourMod = hour % hourToOneCircle
        let majorRadius = (Double(hourMod) / Double(hourToOneCircle)) * Double.pi * 2
        let minorRadius = getMinorHourRadius(from: minute)
        return majorRadius + minorRadius
    }
    
    private func getMinorHourRadius(from minute: Int) -> Double {
        
        return Double(minute) / minuteToHour * Double.pi * 2 / 12
    }
}
