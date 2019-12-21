//
//  PFeedCellViewModel.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/16/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import UIKit

protocol PFeedCellViewModel: PTableViewCellModel{
    func getFeedName() -> String?
    func getDescription() -> String?
    func getStringDate() -> String?
    func getImageUrl() -> String?
    func onSelect()
}
