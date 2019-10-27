//
//  BaseTableViewCell.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 10/27/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    
    var identifier: String {
        return "BaseTableViewCell"
    }
    
}

extension BaseTableViewCell: NibLoadable {}

extension BaseTableViewCell: ReusableView {}
