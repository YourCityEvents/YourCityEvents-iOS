//
//  Response.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/14/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import Foundation

struct Response<T: Decodable>: Decodable {
    let data: T?
    let result: String
    let errors: [String]?
}

struct Empty: Codable { }
