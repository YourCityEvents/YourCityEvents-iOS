//
//  PFeedCellViewModel.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/16/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import Foundation

protocol PFeedCellViewModel: PTableViewCellModel{
    func getFeedName() -> String?
    func getDescription() -> String?
    func onSelect()
}
