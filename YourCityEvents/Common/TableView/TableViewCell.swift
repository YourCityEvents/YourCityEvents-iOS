//
//  TableViewCell.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/16/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    /// ViewModel of cell
    internal var viewModel: PTableViewCellModel?
    /// Setup cell with ViewModel
    func setupCellWithViewModel(_ model: PTableViewCellModel) {
        viewModel = model
        viewModel?.needToUpdateCallback = { [weak self] in
            DispatchQueue.main.async { self?.updateCell() }
        }
        setupUI()
        updateCell()
    }
    /// Update UI of cell
    internal func updateCell() { }
    /// Update cell height
    func reloadCell() {
        guard let tableView = self.superview as? UITableView else { return }
        tableView.performBatchUpdates(nil, completion: nil)
    }
    /// Setup interactions
    internal func setupUI() { }
    class func getCellIdentifier() -> String { return String(describing: self) }
}
