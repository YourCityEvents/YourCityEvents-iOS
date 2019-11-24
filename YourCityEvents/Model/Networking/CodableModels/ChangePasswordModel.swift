//
//  ChangeUserInfo.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/24/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import Foundation

struct ChangePasswordModel: Codable {
    let newPassword: String
    let password: String
}

extension EndpointCollection {
    static let changePassword = Endpoint(method: .PUT, pathEnding: "User/change_password")
}
