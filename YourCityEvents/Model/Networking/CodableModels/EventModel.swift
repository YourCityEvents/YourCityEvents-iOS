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

struct EventModelResponse: Codable {
    let event: EventModel
}

struct EventModel: Codable {    
    var id: String? = nil
    var title: String
    var location: CityModel
    var description: String?
    var owner: UserModel?
    var imageUrl: String?
    var date: String
    var detailLocation: String
    var visitors: [UserModel]?
    var price: Int
}

struct CreateEventModel: Codable {
    var title: String
    var description: String
    var detailLocation: String
    var imageArray: String?
    var price: Int
    var date: String
}

extension EndpointCollection {
    static let getEvents = Endpoint(method: .GET, pathEnding: "Event")
    static let createEvent = Endpoint(method: .POST, pathEnding: "Event")

    static func deleteEvent(with id: String) -> Endpoint {
        return Endpoint(method: .DELETE, pathEnding: "Event/\(id)")
    }
}
