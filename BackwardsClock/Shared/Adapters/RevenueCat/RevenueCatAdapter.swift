//
//  RevenueCatAdapter.swift
//  BackwardsClock
//
//  Created by cm0679 on 2022/7/9.
//

import Foundation
import Combine
import RevenueCat

class RevenueCatAdapter: ObservableObject {
    
    private(set) var fetchedOfferings: Offerings?
    
    @Published var finishedFetch = false
    
    func activateRevenueCat() {
        #if DEBUG
        Purchases.logLevel = .debug
        #endif
        Purchases.configure(withAPIKey: revenuCatAPIKey)
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
        Purchases.shared.purchase(package: package) { transaction, customerInfo, error, userCancelled in
            Logger.log("completed purchase process, trans: \(String(describing: transaction)), info: \(String(describing: customerInfo)), error: \(String(describing: error)), cancelled: \(userCancelled)")
            // TODO: - 完成購買
        }
    }
}
