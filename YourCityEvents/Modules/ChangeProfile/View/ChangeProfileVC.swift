//
//  ChangeVC.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/18/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class ChangeProfileVC: ViewController {
    
    @IBOutlet weak var firstField: SkyFloatingLabelTextField!
    @IBOutlet weak var secondField: SkyFloatingLabelTextField!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        guard  let model = viewModel as? ChangeProfileVM else { return }
        firstField.selectedLineColor = UIColor(named: "MainBlue") ?? UIColor()
        firstField.selectedTitleColor = UIColor(named: "Grey") ?? UIColor()
        firstField.lineColor = UIColor(named: "Grey") ?? UIColor()
        firstField.lineHeight = 1
        
        secondField.selectedLineColor = UIColor(named: "MainBlue") ?? UIColor()
        secondField.selectedTitleColor = UIColor(named: "Grey") ?? UIColor()
        secondField.lineColor = UIColor(named: "Grey") ?? UIColor()
        secondField.lineHeight = 1
        secondField.isSecureTextEntry = true
        
        switch model.type {
        case .email:
            firstField.placeholder = "New email"
            firstField.title = "New email"
            secondField.placeholder = "Current password"
            secondField.title = "Current password"
        case .password:
            firstField.isSecureTextEntry = true
            firstField.placeholder = "Current password"
            firstField.title = "Current password"
            secondField.placeholder = "New password"
            secondField.title = "New password"
        }
    }
}

//MARK: - Actions
extension ChangeProfileVC {
    
    @IBAction func closeAction() {
        self.navigationController?.popViewController(animated: true)

    }
}
