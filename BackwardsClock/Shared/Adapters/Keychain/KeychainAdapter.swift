//
//  KeychainAdapter.swift
//  BackwardsClock
//
//  Created by cm0679 on 2022/7/6.
//

import Foundation
import KeychainAccess

struct KeychainAdapter {
    
    private let keychain = Keychain(service: "io.marvinLin.BackwardsClock")
    
    private var familylNameKey: String {
        "familylNameKey"
    }
    
    private var givenNameKey: String {
        "givenNameKey"
    }
    
    private var appleUserKey: String {
        "appleUserKey"
    }
}

extension KeychainAdapter {
    
    func save(familyName: String) {
        keychain[familylNameKey] = familyName
    }
    
    func save(givenName: String) {
        keychain[givenNameKey] = givenName
    }
    
    func save(appleUser: String) {
        keychain[appleUserKey] = appleUser
    }
    
    func getFamilyName() -> String? {
        return keychain[familylNameKey]
    }
    
    func getGivenName() -> String? {
        return keychain[givenNameKey]
    }
    
    func getAppleUser() -> String? {
        return keychain[appleUserKey]
    }
}
