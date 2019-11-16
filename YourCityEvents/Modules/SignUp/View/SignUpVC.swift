//
//  SignUpVC.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 10/24/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import UIKit

class SignUpVC: ViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let networking = NetworkingService()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        guard var model = viewModel as? PSignUpVM else { return }
        model.callBackOnError = { [weak self] error in
            self?.show(error: error)
        }
        model.callback = { [weak self] in
            self?.clearUserData()
        }
    }
}

//MARK: - Main
extension SignUpVC {
    private func clearUserData() {
        firstNameTextField.text = nil
        lastNameTextField.text = nil
        emailTextField.text = nil
        passwordTextField.text = nil
    }
}

//MARK: - Actions
extension SignUpVC {
    
    @IBAction func signUpButtonPressed() {
        guard let model = viewModel as? PSignUpVM else { return }
        model.signUp(firstNameTextField.text, lastNameTextField.text, emailTextField.text, pass: passwordTextField.text)
    }
}
