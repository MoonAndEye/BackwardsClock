//
//  AppDelegate.swift
//  BackwardsClock (iOS)
//
//  Created by cm0679 on 2022/7/5.
//
#if os(iOS)
import UIKit
import Firebase
import FirebaseMessaging
import RevenueCat

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        registerPushNotification(application)
        activateMessaging()
        activateRemoteConfig()
        activateRevenueCat()
        setRevenueCatDelegate()
        return true
  }
}
// MARK: - push notification
extension AppDelegate: UNUserNotificationCenterDelegate, MessagingDelegate {
    
    private func registerPushNotification(_ application: UIApplication) {
        
        UNUserNotificationCenter.current().delegate = self
        
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(
            options: authOptions,
            completionHandler: { _, _ in }
        )
        
        application.registerForRemoteNotifications()
    }
    
    private func activateMessaging() {
        Messaging.messaging().delegate = self
    }
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        
        Messaging.messaging().token { token, error in
            if let error = error {
                Logger.log("Error fetching FCM registration token: \(error)")
            } else if let token = token {
                Logger.log("FCM registration token: \(token)")
                Logger.log("Remote FCM registration token: \(token)")
            }
        }
    }
    
    private func activateRemoteConfig() {
        RemoteConfigManager.shared.fetchRemoteConfig()
    }
    
    private func activateRevenueCat() {
        RevenueCatAdapter.shared.activateRevenueCat()
    }
}

extension AppDelegate: PurchasesDelegate {
    private func setRevenueCatDelegate() {
        Purchases.shared.delegate = self
    }
    
    func purchases(_ purchases: Purchases, receivedUpdated customerInfo: CustomerInfo) {
        RevenueCatAdapter.shared.update(customerInfo: customerInfo)
    }
}
#endif
