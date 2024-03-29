//
//  FeedCell.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 10/27/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import UIKit

class FeedCell: TableViewCell {
    
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    override func awakeFromNib() {
        self.selectionStyle = .none
    }
    
    override func setupUI() {
        guard let model = viewModel as? PFeedCellViewModel else { return }
        contentView.addTapGestureRecognizer(target: self, action: #selector(eventSelect))
        titleLabel.text = model.getFeedName()
        locationLabel.text = model.getDescription()
        dateLabel.text = model.getStringDate()
        if let url = model.getImageUrl() {
            eventImageView.downloaded(from: url)
        } else {
            DispatchQueue.main.async {
                self.eventImageView.image = UIImage(named: "welcome")
            }
        }
    }
    
    @objc private func eventSelect() {
        guard let model = viewModel as? PFeedCellViewModel else { return }
        model.onSelect()
    }
}
