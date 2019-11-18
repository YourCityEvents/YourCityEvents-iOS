//
//  LoginModel.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/16/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import Foundation

struct AuthResponse: Codable {
    let token: String
}

struct RegisterModel: Codable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
    let city: CityModel?
}

struct LoginModel: Codable {
    let email: String
    let password: String
}

extension EndpointCollection {
    static let register = Endpoint(method: .POST, pathEnding: "Identity/register")
    static let login = Endpoint(method: .POST, pathEnding: "Identity/login")
}
