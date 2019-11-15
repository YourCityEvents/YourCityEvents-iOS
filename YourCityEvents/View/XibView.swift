//
//  XibView.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/15/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import UIKit

class XibView: UIView {
    @IBOutlet internal weak var contentView: UIView!
    deinit { debugPrint("🔻Deinit \(type(of: self))") }
    func setupUI() { }
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    func commonInit() {
        debugPrint("🔺Init \(type(of: self))")
        Bundle.main.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)
        backgroundColor = .clear
        contentView.fixateInView(self)
        setupUI()
    }
    override func prepareForInterfaceBuilder() {
        contentView.fixateInView(self)
        setupUI()
    }
}
extension UIView {
    func fixateInView(_ container: UIView!) {
        container.addSubview(self)
        container.translatesAutoresizingMaskIntoConstraints = false
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leftAnchor.constraint(equalTo: container.leftAnchor).isActive = true
        self.rightAnchor.constraint(equalTo: container.rightAnchor).isActive = true
        self.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
    }
}
