//
//  File.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/14/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import UIKit

class ShadowView: UIView {

    private var shadowLayer: CAShapeLayer!
    @IBInspectable var cornerRadius: CGFloat = 8.0
    
    override func layoutSubviews() {
        super.layoutSubviews()

        if shadowLayer == nil {
            shadowLayer = CAShapeLayer()
          
            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
            shadowLayer.fillColor = UIColor.white.cgColor

            shadowLayer.shadowColor = UIColor(red:0.18, green:0.30, blue:0.53, alpha:1.0).cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = CGSize(width: 0.0, height: 5.0)
            shadowLayer.shadowOpacity = 0.15
            shadowLayer.shadowRadius = 10.0

            layer.insertSublayer(shadowLayer, at: 0)
        } else {
            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
            shadowLayer.shadowPath = shadowLayer.path
        }
    }

}
