//
//  UpdateImage.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/24/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import Foundation

struct UpdateImageResponse: Codable {
    let path: String
}

struct UpdateImageModel: Codable {
    let array: String
}

extension EndpointCollection {
    static let updateUserImage = Endpoint(method: .PUT, pathEnding: "User/upload_image")
}
