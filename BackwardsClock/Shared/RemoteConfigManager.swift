//
//  RemoteConfigManager.swift
//  BackwardsClock
//
//  Created by cm0679 on 2022/7/5.
//

import Foundation
import FirebaseRemoteConfig

extension RemoteConfigManager {
    enum AppStatus: Int {
        case recommendToUpdate = -2 //建議更新
        case forceUpdate = -1 //強更
        case success = 1 //一般狀態
        case underReviewing = 2 //審查中
    }
}

/// 專門處理 Firebase remote config 的物件
class RemoteConfigManager: ObservableObject {
    
    @Published var appStatus: AppStatus = .success
    
    static let shared = RemoteConfigManager()
    
    private var appStatusKey: String {
        "appStatus"
    }
    
    private lazy var remoteConfig: RemoteConfig = {
        let config = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        config.configSettings = settings
        config.setDefaults(fromPlist: "remote_config_defaults")
        return config
    }()
    
    private init() {}
    
    func fetchRemoteConfig() {
        
        remoteConfig.fetch { status, error in
            
            if let error = error {
                Logger.log("fetch remote config error: \(error)), description: \(error)")
                return
            }
            
            self.update(status: status)
        }
    }
    
    private func update(status: RemoteConfigFetchStatus) {
        
        if status == .noFetchYet {
            appStatus = .success
        } else if status == .throttled {
            appStatus = .success
        } else if status == .success {
            Logger.log("成功拿到 remote config: \(status)")
            updateRemoteConfig()
        }
    }
    
    private func updateRemoteConfig() {
        
        Logger.log("config: \(remoteConfig.configValue(forKey: appStatusKey).numberValue.intValue)")
        
        if let appStatus = AppStatus(rawValue: remoteConfig.configValue(forKey: appStatusKey).numberValue.intValue) {
            Logger.log("app status: \(appStatus)")
            self.appStatus = appStatus
        }
    }
}
