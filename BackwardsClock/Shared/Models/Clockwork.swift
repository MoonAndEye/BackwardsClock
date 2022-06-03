//
//  Movement.swift
//  BackwardsClock
//
//  Created by cm0679 on 2022/5/29.
//

import Foundation
import Combine

// 機芯
class Clockwork: ObservableObject {

    var oldTimer: Timer?
    
    @Published var timestamp: TimeInterval = 0
    
    @Published var secondAngle: Double = .zero
    
    @Published var minuteAngle: Double = .zero
    
    @Published var hourAngle: Double = .zero
    
    private var angleUtility: AngleUtility = .init()
    
    init() {
        startTimer()
    }
    
    func stopTimer() {
        oldTimer?.invalidate()
    }
    
    func startTimer() {
        oldTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { [weak self] timer in
            guard let self = self else { return }
            self.updateTime()
        })
        oldTimer?.fire()
    }
    
    private func updateTime() {
        let timestamp = Date().timeIntervalSince1970
        calculateAngle(from: timestamp)
        self.timestamp = timestamp
    }
    
    private func calculateAngle(from timeInterval: TimeInterval) {
        
        secondAngle = angleUtility.getBackwardsSecondHandRadius(from: timeInterval)
        minuteAngle = angleUtility.getBackwardsMinuteHandRadius(from: timeInterval)
        hourAngle = angleUtility.getBackwardsHourHandRadius(from: timeInterval)
    }
    
    private func update(timeInterval: TimeInterval) {
        timestamp = timeInterval
        print("timestamp updated: \(timestamp)")
    }
}
