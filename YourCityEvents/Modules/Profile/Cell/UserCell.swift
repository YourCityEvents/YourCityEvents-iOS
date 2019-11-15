//
//  UserCell.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 10/27/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import UIKit

class UserCell: BaseTableViewCell {
    
    @IBOutlet weak var myContentView: UIView!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    
    
    override var identifier: String {
        return "UserCell"
    }
    
    override func awakeFromNib() {
        
        self.selectionStyle = .none
        myContentView.layer.cornerRadius = 8
    }
    
}
