//
//  PFeedVM.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/16/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import Foundation

protocol PFeedVM: PTableViewModel {
    var onUpdateDataSource: (() -> ())? { get set }
}
