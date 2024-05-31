//
//  UserDefaultsManager.swift
//  SeSacWeek3
//
//  Created by Minjae Kim on 5/31/24.
//

import Foundation

// SingleTon Pattern
final class UserDefaultsManager {
    
    static let shared = UserDefaultsManager()
    
    private init() { }
    
    public var nickname: String {
        
        get {
            return UserDefaults.standard.string(forKey: SettingViewController.nicknameKey) ?? ""
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: SettingViewController.nicknameKey)
        }
    }
    
    public var phone: String {
        
        get {
            return UserDefaults.standard.string(forKey: SettingViewController.phoneKey) ?? ""
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: SettingViewController.phoneKey)
        }
    }
    
    public var location: String {
        
        get {
            return UserDefaults.standard.string(forKey: SettingViewController.locationKey) ?? ""
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: SettingViewController.locationKey)
        }
    }
}
