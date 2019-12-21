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
    var firstName: String
    var lastName: String
    var bio: String?
    var email: String
    var city: CityModel
    var hostingEvents: [EventModel]?
    var visitingEvents: [EventModel]?
    var imageUrl: String?
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }
}

extension EndpointCollection {
    static let getUser = Endpoint(method: .GET, pathEnding: "User")
}
