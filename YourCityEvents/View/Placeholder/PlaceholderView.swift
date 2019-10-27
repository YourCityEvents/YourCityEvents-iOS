//
//  PlaceholderView.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 10/27/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import UIKit

class PlaceholderView: UIView {
    
    @IBOutlet weak var containerView: UIView!
    
    //MARK: - Init
    convenience init() {
        
        self.init(frame: .zero)
        configure()

    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        configure()

    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        configure()
    }
    
    //MARK: - LifeCycle
    override func awakeFromNib() {
        
        super.awakeFromNib()
        configure()

    }
    
    fileprivate func configure() {
        
        self.addSubview(self.containerView)
        self.containerView.frame = self.bounds
        self.containerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}

////MARK: - Configure
//extension BaseView {
//
//    @objc func configure() {
//
//        self.addSubview(self.containerView)
//        self.containerView.frame = self.bounds
//        self.containerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//    }
//}
//
////MARK: - NibLoadable
//extension BaseView: NibLoadable {}
//
//
//}
