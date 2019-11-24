//
//  ChangeVC.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/18/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import SVProgressHUD

class ChangeProfileVC: ViewController {
    
    @IBOutlet weak var firstField: SkyFloatingLabelTextField!
    @IBOutlet weak var secondField: SkyFloatingLabelTextField!
    @IBOutlet weak var titleLabel: UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        guard let model = viewModel as? ChangeProfileVM else { return }
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
            titleLabel.text = "Change email"
            firstField.placeholder = "New email"
            firstField.title = "New email"
            secondField.placeholder = "Current password"
            secondField.title = "Current password"
        case .password:
            titleLabel.text = "Change password"
            firstField.isSecureTextEntry = true
            firstField.placeholder = "Current password"
            firstField.title = "Current password"
            secondField.placeholder = "New password"
            secondField.title = "New password"
        }
        
        model.callBackOnShowHud = {
            SVProgressHUD.show()
        }
        
        model.callBackOnDismissHud = {
            SVProgressHUD.dismiss()
        }
        
        model.callBackOnError = { [weak self] error in
            self?.show(error: error)
        }
    }
}

//MARK: - Actions
extension ChangeProfileVC {
    
    @IBAction func closeAction() {
        Router.showEditProfile()
    }
    
    @IBAction func doneAction() {
        guard  let model = viewModel as? ChangeProfileVM else { return }
        switch model.type {
        case .email:
            model.updateEmail(firstField.text, secondField.text)
        case .password:
            model.updatePassword(firstField.text, secondField.text)
        }
    }
}
