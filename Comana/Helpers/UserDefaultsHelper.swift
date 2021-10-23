//
//  UserDefaultsHelper.swift
//  Comana
//
//  Created by Tudor Croitoru on 14/10/2021.
//

import Foundation


struct UserDefaultsHelper {
    
    private init() {}
    
    static var shared = UserDefaultsHelper()
    
    let userDef = UserDefaults.standard
    
    enum PersistentOptions: String {
        case InstallIdentifier = "installidentifier"
        case Username = "username"
    }
    
    func setUserIdentifier(id: UUID) {
        userDef.set(id.uuidString, forKey: PersistentOptions.InstallIdentifier.rawValue)
    }
    
    func getUserIdentifier() -> UUID? {
        if let uuidString = userDef.value(forKey: PersistentOptions.InstallIdentifier.rawValue) as? String {
            return UUID.init(uuidString: uuidString)
        }
        
        return nil
    }
    
    func setUserName(name: String) {
        userDef.set(name, forKey: PersistentOptions.Username.rawValue)
    }
    
    func getUserName() -> String? {
        return userDef.string(forKey: PersistentOptions.Username.rawValue)
    }
    
}
