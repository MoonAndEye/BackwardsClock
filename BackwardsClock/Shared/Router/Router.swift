//
//  Router.swift
//  BackwardsClock
//
//  Created by cm0679 on 2022/6/5.
//

import SwiftUI

class Router: ObservableObject {
    
    static let shared = Router()
    
    private init() {}
    
    @Published var currentState: State = .launch
    
    @ViewBuilder
    func getView(from state: State) -> some View {
        switch state {
        case .launch:
            LaunchQuoteView()
        case .backwardsClock:
            ClockContainerView()
        }
    }
}

extension Router {
    
    enum State {
        case launch
        case backwardsClock
    }
}
