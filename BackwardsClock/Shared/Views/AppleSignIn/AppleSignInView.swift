//
//  AppleSignIn.swift
//  BackwardsClock
//
//  Created by cm0679 on 2022/7/6.
//

import SwiftUI
import AuthenticationServices

struct AppleSignIn: View {
    
    private let authManager = AppleAuthManager()
    
    var body: some View {
        
        ZStack {
            BCColor
                .clockContainerBackground
                .ignoresSafeArea()
            VStack {
                Text("Backwards Clock")
                    .font(.largeTitle)
                    .padding(.top, 80)
                Image(systemName: "clock.arrow.circlepath")
                    .font(.system(size: 80))
                    .padding(.top)
                HStack {
                    Spacer(minLength: 40)
                    SignInWithAppleButton(.signIn) { request in
                        
                    } onCompletion: { result in
                        
                    }
                    .signInWithAppleButtonStyle(.whiteOutline)
                    .frame(height: 50)
                    Spacer(minLength: 40)
                }
                .padding(.top, 80)
                Spacer()
            }
            
        }
    }
}

struct AppleSignIn_Previews: PreviewProvider {
    static var previews: some View {
        AppleSignIn()
    }
}
