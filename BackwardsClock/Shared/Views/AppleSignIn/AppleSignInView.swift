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
                        request.requestedScopes = [.fullName, .email]
                    } onCompletion: { result in
                        handleAppleSignIn(result: result)
                    }
                    .signInWithAppleButtonStyle(.whiteOutline)
                    .frame(height: 50)
                    Spacer(minLength: 40)
                }
                .padding(.top, 80)
                .padding(.bottom, 10)
                Text("This App was inspired from")
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .font(.system(size: 20))
                    .padding(.top, 40)
                HStack {
                    Text("- Grace Hopper -")
                        .lineLimit(1)
                        .font(.custom("SnellRoundhand-Black", size: 30))
                        .minimumScaleFactor(0.2)
                        .padding()
                }
                Spacer()
            }
            
        }
    }
    
    private func handleAppleSignIn(result: Result<ASAuthorization, Error>) {
        
        switch result {
        case .success(let auth):
            Logger.log("Apple sign in success: \(auth)")
            Router.shared.currentState = .backwardsClock
            handleCredential(credential: auth.credential)
        case .failure(let error):
            Logger.log("Apple auth got error: \(error), description: \(error.localizedDescription)")
        }
    }
    
    private func handleCredential(credential: ASAuthorizationCredential) {
        
        if let appleCredential = credential as? ASAuthorizationAppleIDCredential {
            
            let keychainAdapter = KeychainAdapter()
            
            let user = appleCredential.user
            keychainAdapter.save(appleUser: user)
            
            if let familyName = appleCredential.fullName?.familyName {
                keychainAdapter.save(familyName: familyName)
            }
            
            if let givenName = appleCredential.fullName?.givenName {
                keychainAdapter.save(givenName: givenName)
            }
        }
    }
}

struct AppleSignIn_Previews: PreviewProvider {
    static var previews: some View {
        AppleSignIn()
    }
}
