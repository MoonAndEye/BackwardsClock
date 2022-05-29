//
//  Movement.swift
//  BackwardsClock
//
//  Created by cm0679 on 2022/5/29.
//

import Foundation
import Combine

// 機芯
// 先用 peter pan 的方法
// https://medium.com/%E5%BD%BC%E5%BE%97%E6%BD%98%E7%9A%84-swift-ios-app-%E9%96%8B%E7%99%BC%E5%95%8F%E9%A1%8C%E8%A7%A3%E7%AD%94%E9%9B%86/%E5%88%A9%E7%94%A8-combine-%E8%A7%A3%E6%B1%BA-swiftui-timer-notificationcenter-%E7%9A%84%E8%A8%98%E6%86%B6%E9%AB%94%E5%95%8F%E9%A1%8C-653aac155fc5
class Movement: ObservableObject {
    
    @Published var timeInterval: TimeInterval = Date().timeIntervalSince1970
    
    init() {
        startTimer()
    }
    
    private func startTimer() {
        
    }
    
    func updateTime() {
        
        let date = Date().timeIntervalSince1970
    }
}
