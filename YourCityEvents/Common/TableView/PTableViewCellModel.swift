//
//  P.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/16/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import Foundation

protocol PTableViewCellModel {
    /// Update callback
    var needToUpdateCallback:(() -> Void)? { get set }
    /// Cell identifire
    var cellIdentifire: String { get set }
    /// Height of cell
    var cellHeight: Float { get set }
}
