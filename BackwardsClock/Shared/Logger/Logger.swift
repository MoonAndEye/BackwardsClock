//
//  Logger.swift
//  BackwardsClock
//
//  Created by cm0679 on 2022/7/5.
//

import Foundation

struct Logger {
    
    /// 輸出訊息
    static func log<T>(message: T, file: String = #file, method: String = #function) {
        #if DEBUG
        let fileName = (file as NSString).lastPathComponent
        print("[\(fileName): \(method)] \(message)")
        #endif
    }
    
    /// 輸出訊息
    static func log<T>(_ message: T) {
        #if DEBUG
        print(message)
        #endif
    }
}
