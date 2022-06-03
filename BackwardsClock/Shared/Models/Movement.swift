//
//  Movement.swift
//  BackwardsClock
//
//  Created by cm0679 on 2022/5/29.
//

import SwiftUI
import Combine

// 機芯

//Connect to external reference model data that conforms to the ObservableObject protocol using the ObservedObject property wrapper. Gain access to an observable object stored in the environment using the EnvironmentObject property wrapper. Instantiate an observable object directly in a view using a StateObject.
class Movement: ObservableObject {

    var oldTimer: Timer?
    
    @Published var timestamp: TimeInterval = 0
    
    @Published var secondAngle: Angle = .zero
    
    @Published var minuteAngle: Angle = .zero
    
    @Published var hourAngle: Angle = .zero
    
    private var angleUtility: AngleUtility = .init()
    
    init() {
        startTimer()
    }
    
    private func startTimer() {
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
        
        secondAngle = Angle(radians: angleUtility.getBackwardsSecondHandRadius(from: timeInterval))
        minuteAngle = Angle(radians: angleUtility.getBackwardsMinuteHandRadius(from: timeInterval))
        hourAngle = Angle(radians: angleUtility.getBackwardsHourHandRadius(from: timeInterval))
    }
    
    private func update(timeInterval: TimeInterval) {
        timestamp = timeInterval
        print("timestamp updated: \(timestamp)")
    }
}
