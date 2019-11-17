//
//  CityCell.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/17/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import UIKit

class CityCell: TableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func setupUI() {
        guard let model = viewModel as? PCityCellVM else { return }
        contentView.addTapGestureRecognizer(target: self, action: #selector(citySelected))
        titleLabel.text = model.getName()
    }
    
    @objc private func citySelected() {
        guard let model = viewModel as? PCityCellVM else { return }
        model.onSelect()
    }

}
