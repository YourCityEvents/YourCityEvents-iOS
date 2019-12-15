//
//  EventModel.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/24/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import Foundation

struct EventsModelResponse: Codable {
    let events: [EventModel]
}

struct EventModel: Codable {
    var id: String? = nil
    var title: String?
    var location: CityModel
    var description: String?
    var owner: UserModel?
    var imageUrl: String?
    var price: Int
}

extension EndpointCollection {
    static let getEvents = Endpoint(method: .GET, pathEnding: "Event")
}
