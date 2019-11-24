//
//  AvatarCell.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/18/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import UIKit

class AvatarCell: TableViewCell {
    
    @IBOutlet weak var userImageView: UIImageView!
    
    override func setupUI() {
        super.setupUI()
        selectionStyle = .none
        guard let model = viewModel as? PAvatarCellVM else { return }
        if let url = model.getStringUrl() {
            userImageView.downloaded(from: url, contentMode: .scaleAspectFill)
        }else {
            guard let image = model.getImage() else {
                userImageView.image = UIImage(named: "editPhoto")
                return
            }
            userImageView.image = image
        }
    }
    
    @IBAction func changeAvatarAction() {
        guard let model = viewModel as? PAvatarCellVM else { return }
        model.onTap()
    }
}
