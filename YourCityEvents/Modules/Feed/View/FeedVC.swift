//
//  FeedVC.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 10/27/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import UIKit

class FeedVC: TableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        guard let model = viewModel as? PFeedVM else { return }
        model.getFeed()
    }
}

extension FeedVC {
    
    fileprivate func configure() {
        guard var model = viewModel as? PFeedVM else { return }
        configureTableView()
        model.onUpdateDataSource = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        model.onError = { [weak self] error in
            DispatchQueue.main.async {
                self?.show(error: error)
            }
        }
    }
    
    fileprivate func configureTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 2.0
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    
}
