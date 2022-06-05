//
//  BackwardsClockApp.swift
//  Shared
//
//  Created by cm0679 on 2022/5/28.
//

import SwiftUI

@main
struct BackwardsClockApp: App {
    
    @StateObject var router = Router.shared
    
    var body: some Scene {
        WindowGroup {
            router.getView(from: router.currentState)
        }
    }
}
