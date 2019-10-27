//
//  BaseTableHeaderFooterView.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 10/27/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import UIKit

class BaseTableHeaderFooterView: UITableViewHeaderFooterView {
    
    var identifier: String {
        return "BaseTableViewCell"
    }
    
}

extension BaseTableHeaderFooterView: NibLoadable {}

extension BaseTableHeaderFooterView: ReusableView {}
