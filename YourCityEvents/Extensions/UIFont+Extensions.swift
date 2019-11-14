//
//  UIFont+Extensions.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/14/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import UIKit

extension UIFont {
    
    enum RobotoStyle: String {
        case medium = "Roboto-Medium"
    }
    
    static func customFont(_ style: RobotoStyle, ofSize: CGFloat) -> UIFont {
        let font = UIFont(name: "\(style.rawValue)", size: ofSize)
        assert(font != nil, "Can't load font \(style.rawValue)")
        return font ?? UIFont.systemFont(ofSize: ofSize)
    }
    
}
