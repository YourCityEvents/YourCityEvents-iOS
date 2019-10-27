//
//  ReusableView.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 10/27/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import UIKit

public protocol ReusableView: class {
    
    static var reuseIdentifier: String { get }
    
}

public extension ReusableView where Self: UIView {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
}
