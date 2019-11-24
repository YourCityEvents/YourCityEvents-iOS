//
//  User.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/14/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import Foundation
import SwiftKeychainWrapper

struct UserSensitiveModel {
    let login: String
    let password: String
    let token: String
}

struct User {
    
    static private var _current: UserSensitiveModel?
    
    static var current: UserSensitiveModel? {
        guard let cachedUser = _current else {
            if let login = KeychainWrapper.standard.string(forKey: "login"), let password = KeychainWrapper.standard.string(forKey: "password"), let token = KeychainWrapper.standard.string(forKey: "token") {
                _current = UserSensitiveModel(login: login, password: password, token: token)
            }
            return _current
        }
        return cachedUser
    }
    
    // MARK: - Update
    @discardableResult
    static func update(login: String) -> Bool {
        defer { _current = nil }
        return KeychainWrapper.standard.set(login, forKey: "login")
    }
    
    @discardableResult
    static func update(password: String) -> Bool {
        defer { _current = nil }
        return KeychainWrapper.standard.set(password, forKey: "password")
    }
    
    @discardableResult
    static func update(token: String) -> Bool {
        defer { _current = nil }
        return KeychainWrapper.standard.set(token, forKey: "token")
    }
    
    // MARK: - Save / Clear
    @discardableResult
    static func save(model: UserSensitiveModel) -> Bool {
        var saveSuccessful = true
        saveSuccessful = saveSuccessful && KeychainWrapper.standard.set(model.login, forKey: "login")
        saveSuccessful = saveSuccessful && KeychainWrapper.standard.set(model.password, forKey: "password")
        saveSuccessful = saveSuccessful && KeychainWrapper.standard.set(model.token, forKey: "token")
        if saveSuccessful {
            _current = model
        }
        return saveSuccessful
    }
    
    @discardableResult
    static func clear() -> Bool {
        var clearSuccessful = true
        clearSuccessful = clearSuccessful && KeychainWrapper.standard.removeObject(forKey: "login")
        clearSuccessful = clearSuccessful && KeychainWrapper.standard.removeObject(forKey: "password")
        clearSuccessful = clearSuccessful && KeychainWrapper.standard.removeObject(forKey: "token")
        return clearSuccessful
    }
}

