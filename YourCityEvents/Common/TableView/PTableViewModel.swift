//
//  File.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/16/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import Foundation

protocol PTableViewModel: PViewControllerViewModel {
    /// Get viewModel of cell
    func getViewModel(_ indexPath: IndexPath) -> PTableViewCellModel
    /// Source array
    var sourceArray: [PTableViewCellModel] { get set }
    /// Get count of rows
    func getCountRows() -> Int
}

extension PTableViewModel {
    func getViewModel(_ indexPath: IndexPath) -> PTableViewCellModel { return sourceArray[indexPath.row] }
    func getCountRows() -> Int { return sourceArray.count }
}
