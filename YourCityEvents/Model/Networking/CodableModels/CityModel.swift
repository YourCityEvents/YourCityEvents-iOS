//
//  CityModel.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/16/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import Foundation

struct CitiesResponse: Codable {
    let cities: [CityModel]
}

struct CityModel: Codable {
    let id: String
    let nameEn: String
    let nameUa: String
}

extension EndpointCollection {
    static let getCities = Endpoint(method: .GET, pathEnding: "api/City")
}
