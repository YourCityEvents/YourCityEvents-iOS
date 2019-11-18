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
        guard let model = viewModel as? PAvatarCellVM else { return }
        userImageView.image = model.getImage()
    }
    
    @IBAction func changeAvatarAction() {
        guard let model = viewModel as? PAvatarCellVM else { return }
        model.onTap()
    }
}
