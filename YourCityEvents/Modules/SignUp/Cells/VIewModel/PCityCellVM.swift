//
//  PCiteCellVM.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/17/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import Foundation

protocol PCityCellVM: PTableViewCellModel {
    func getName() -> String
    func onSelect()
}
