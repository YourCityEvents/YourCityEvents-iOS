//
//  FeedCell.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 10/27/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import UIKit

class FeedCell: BaseTableViewCell {
    
    
    @IBOutlet weak var myContentView: UIView!
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    override var identifier: String {
        return "FeedCell"
    }
    
    override func awakeFromNib() {
        myContentView.layer.cornerRadius = 8
        self.selectionStyle = .none
    }

}
