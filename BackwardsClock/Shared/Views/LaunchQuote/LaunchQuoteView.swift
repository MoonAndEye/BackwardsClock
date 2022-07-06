//
//  LaunchQuoteView.swift
//  BackwardsClock
//
//  Created by cm0679 on 2022/6/5.
//

import SwiftUI

struct LaunchQuoteView: View {
    
    var body: some View {
        CounterClockwiseQuote()
            .onAppear {
                switchToMainOrAppleSignIn()
            }
    }
    
    private func switchToMainOrAppleSignIn() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
            if RemoteConfigManager.shared.appStatus == .underReviewing {
                switchToAppleSignInView()
            } else {
                switchToMainView()
            }
        }
    }
    
    private func switchToAppleSignInView() {
        Router.shared.currentState = .appleSignIn
    }
    
    private func switchToMainView() {
        Router.shared.currentState = .backwardsClock
    }
}

struct QuoteMessageContainer: View {
    
    @Environment(\.dismiss) var dismiss
    
    var dismissButton: some View {
        return DismissButtonBuilder
            .getDismissButton(action: dismiss, image: Image(systemName: "x.circle"))
    }
    
    var body: some View {
            
        VStack {
            HStack {
                Spacer()
                dismissButton
                    .font(.system(size: 44))
                    .tint(.black)
                    .padding([.top, .trailing])
                
            }
            CounterClockwiseQuote()
        }
    }
}

struct LaunchQuoteView_Previews: PreviewProvider {
    static var previews: some View {
        CounterClockwiseQuote()
        QuoteMessageContainer()
    }
}
