//
//  RevenueCatAdapter.swift
//  BackwardsClock
//
//  Created by cm0679 on 2022/7/9.
//

import Foundation
import Combine
import RevenueCat

extension RevenueCatAdapter {
    static var buyDeveloperACafeKey: String {
        "buy_developer_a_cafe"
    }
}

class RevenueCatAdapter: ObservableObject {
    
    static let shared = RevenueCatAdapter()
    private init() {}
    
    private(set) var fetchedOfferings: Offerings?
    
    @Published var finishedFetch = false
    
    @Published var isVIP = false {
        didSet {
            Logger.log("RevenuCat isVIP state changed: \(self.isVIP)")
        }
    }
    
    func activateRevenueCat() {
        #if DEBUG
        Purchases.logLevel = .debug
        #endif
        Purchases.configure(withAPIKey: revenuCatAPIKey)
        getCustomerInfo() // activate 後就去拿 customer info
    }
}

extension RevenueCatAdapter {
    
    func getCustomerInfo() {
        
        Purchases.shared.getCustomerInfo { [weak self] customerInfo, error in
            if let error = error {
                Logger.log("RevenueCat customer info error: \(error), description: \(error.localizedDescription)")
                return
            }
            
            if let customerInfo = customerInfo {
                self?.update(customerInfo: customerInfo)
            }
        }
    }
    
    func update(customerInfo: CustomerInfo) {
        Logger.log("RevenueCat customer info: \(String(describing: customerInfo))")
        
        if customerInfo.entitlements.all[RevenueCatAdapter.buyDeveloperACafeKey]?.isActive == true {
            isVIP = true
            Logger.log("RevenueCat is activate: 已確認購買")
        } else {
            isVIP = false
            Logger.log("RevenueCat : 使用者不是 VIP")
        }
    }
    
    func fetchOfferings() {
        
        Task { @MainActor in
            
            Logger.log("Start fetch offers")
            Purchases.shared.getOfferings {[weak self] offerings, error in
                guard let self = self else { return }
                if let error = error {
                    Logger.log("RevenueCat fetch offering got error: \(error), description: \(error.localizedDescription)")
                    return
                }
                
                if let offerings = offerings {
                    Logger.log("RevenueCat got offerings: \(offerings)")
                    self.fetchedOfferings = offerings
                    self.finishedFetch = true
                    return
                }
                
                Logger.log("RevenueCat got no error and no offerings")
            }
        }
    }
    
    /// 目前唯一的訂閱制購買
    func purchaseBuyDeveloperACafe() {
        guard let fetchedOfferings = fetchedOfferings,
              let current = fetchedOfferings.current,
              let monthlyPackage = current.monthly else {
                  return
              }
        
        purchase(package: monthlyPackage)
    }
    
    func purchase(package: Package) {
        Purchases.shared.purchase(package: package) { [weak self] transaction, customerInfo, error, userCancelled in
            Logger.log("completed purchase process, trans: \(String(describing: transaction)), info: \(String(describing: customerInfo)), error: \(String(describing: error)), cancelled: \(userCancelled)")
            
            if let customerInfo = customerInfo {
                self?.update(customerInfo: customerInfo)
            }
        }
    }
}
