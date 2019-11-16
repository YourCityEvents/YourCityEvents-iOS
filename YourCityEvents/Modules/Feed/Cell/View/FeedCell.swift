//
//  FeedCell.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 10/27/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import UIKit

class FeedCell: TableViewCell {
    @IBOutlet weak var myContentView: UIView!
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    override func awakeFromNib() {
        myContentView.layer.cornerRadius = 8
        self.selectionStyle = .none
    }
    
    override func setupUI() {
        guard let model = viewModel as? PFeedCellViewModel else { return }
        myContentView.addTapGestureRecognizer(target: self, action: #selector(eventSelect))
        titleLabel.text = model.getFeedName()
        locationLabel.text = model.getDescription()
    }
    
    @objc private func eventSelect() {
        guard let model = viewModel as? PFeedCellViewModel else { return }
        model.onSelect()
    }
}
