//
//  LoginVC.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 10/24/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import UIKit

class LoginVC: ViewController {
    @IBOutlet weak var loginView: InputView!{ didSet {loginView.validator = EmailValidator()}}
    @IBOutlet weak var passwordView: InputView!{didSet{passwordView.validator = PasswordValidator()}}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
//        guard var model = viewModel as? PLoginVM else { return }
    }
}

//MARK: - Actions
extension LoginVC {
    
    @IBAction func signUpButtonPressed() {
        guard let model = viewModel as? PLoginVM else { return }
        model.signUpPressed()
    }
    
    @IBAction func loginButtonPressed() {
        guard let model = viewModel as? PLoginVM else { return }
        model.loginUser(loginView.text, pass: passwordView.text)
    }
}

