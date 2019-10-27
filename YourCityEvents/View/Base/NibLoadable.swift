//
//  NibLoadable.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 10/27/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import UIKit

public protocol NibLoadable: class {
    
    var identifier: String { get }
    static var nibName: String { get }
    static func nib() -> UINib
    
    func load()
    
}

extension NibLoadable where Self: UIView {
    
    static var nibName: String {
        return String(describing: self)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: self.nibName, bundle: Bundle.main)
    }
    
    func load() {
        Bundle.main.loadNibNamed(self.identifier, owner: self, options: nil)
    }
}
