//
//  TableViewController.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/16/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import UIKit

class TableViewController: ViewController {
    @IBOutlet internal weak var tableView: UITableView! {
        didSet { tableView.delegate = self; tableView.dataSource = self }
    }
}

extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let model = viewModel as? PTableViewModel else { return 0 }
        return model.getCountRows()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let model = viewModel as? PTableViewModel {
            let cellModel = model.getViewModel(indexPath)
            if tableView.dequeueReusableCell(withIdentifier: cellModel.cellIdentifire) == nil {
                tableView.register(UINib(nibName: cellModel.cellIdentifire, bundle: nil),
                                   forCellReuseIdentifier: cellModel.cellIdentifire)
            }
            if let cell = tableView.dequeueReusableCell(withIdentifier: cellModel.cellIdentifire,
                                                        for: indexPath) as? TableViewCell {
                cell.setupCellWithViewModel(cellModel)
                return cell
            }
        }
        return UITableViewCell()
    }
}

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let model = viewModel as? PTableViewModel else { return 0.0 }
        return CGFloat(model.getViewModel(indexPath).cellHeight)
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let model = viewModel as? PTableViewModel else { return 0.0 }
        return CGFloat(model.getViewModel(indexPath).cellHeight)
    }
}
