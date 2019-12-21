//
//  EditProfileCell.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/18/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import UIKit

class EditProfileCell: TableViewCell {
    
    @IBOutlet weak var arrowImageView: UIImageView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func setupUI() {
        guard let model = viewModel as? PEditProfileCellVM else { return }
        contentView.addTapGestureRecognizer(target: self, action: #selector(eventSelect))
        iconImageView.image = model.getIcon()
        titleLabel.text = model.getTitle()
        arrowImageView.isHidden = model.isHideArrow()
        if model.isHideArrow() {
            titleLabel.textColor = .red
        } else {
            titleLabel.textColor = .black
        }
    }
    
    @objc private func eventSelect() {
        guard let model = viewModel as? PEditProfileCellVM else { return }
        model.onTap()
    }
}
