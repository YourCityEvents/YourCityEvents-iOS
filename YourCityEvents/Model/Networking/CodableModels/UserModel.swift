//
//  UserModel.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/24/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import Foundation

struct UserResponseModel: Codable {
    let user: UserModel
}

struct UserModel: Codable {
    let id: String
    let firstName: String
    let lastName: String
    let bio: String?
    let email: String
    let city: CityModel
    let hostingEvents: String?
    let visitingEvents: String?
    let imageUrl: String?
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }
}

extension EndpointCollection {
    static let getUser = Endpoint(method: .GET, pathEnding: "User")
}
