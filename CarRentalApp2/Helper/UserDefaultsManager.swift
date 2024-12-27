//
//  UserDefaultsManager.swift
//  CarRentalApp2
//
//  Created by Mac on 27.12.24.
//

import Foundation

class  UserDefaultsManager {
    enum UserDefaultsTypes: String {
        case isLoggedIn = "isLoggedIn"
        case isSaved = "isSaved"
    }
    
    func setValue(value: Any, key: UserDefaultsTypes) {
        UserDefaults.standard.setValue(value, forKey: key.rawValue)
    }
    
    func getBool(key: UserDefaultsTypes) -> Bool {
        UserDefaults.standard.bool(forKey: key.rawValue)
    }
}
