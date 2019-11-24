//
//  ChangeEmailModel.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/24/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import Foundation

struct ChangeEmailModel: Codable {
    let newEmail: String
    let password: String
}

extension EndpointCollection {
    static let changeEmail = Endpoint(method: .PUT, pathEnding: "User/change_email")
}
