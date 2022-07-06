//
//  AppleAuthManager.swift
//  BackwardsClock
//
//  Created by cm0679 on 2022/7/6.
//

import Foundation
import AuthenticationServices

class AppleAuthManager {
    
    private lazy var appleIDProvider = ASAuthorizationAppleIDProvider()
    
    func userHasAppleAuth(userID: String, completion: @escaping ((Bool) -> Void)) {
        
        appleIDProvider.getCredentialState(forUserID: userID) { credentialState, error in
            
            if let error = error {
                Logger.log("apple id provider auth got error: \(error), description: \(error.localizedDescription)")
                completion(false)
                return
            }
            
            switch credentialState {
            case .authorized:
                Logger.log("apple id provider auth passed")
                completion(true)
            case .notFound, .revoked:
                Logger.log("apple id provider auth failed. State: \(credentialState)")
                completion(false)
            default:
                Logger.log("apple id provider auth failed. State: \(credentialState)")
                completion(false)
            }
        }
    }
}
