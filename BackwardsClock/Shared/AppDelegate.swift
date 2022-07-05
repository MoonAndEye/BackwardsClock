//
//  AppDelegate.swift
//  BackwardsClock (iOS)
//
//  Created by cm0679 on 2022/7/5.
//
#if os(iOS)
import UIKit
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}
#endif
