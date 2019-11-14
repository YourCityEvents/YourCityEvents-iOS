//
//  User.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/14/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import Foundation

struct UserModel {
    let login: String
    let password: String
    let token: String
}

struct User {
    
    static private var _current: UserModel?
    
    static var current: UserModel? {
        return _current
    }
}

