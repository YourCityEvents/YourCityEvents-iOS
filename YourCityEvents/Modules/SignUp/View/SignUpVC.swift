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
    }
}

//MARK: - Actions
extension SignUpVC {
    
    @IBAction func signUpButtonPressed() {
        guard let model = viewModel as? PSignUpVM else { return }
        model.signUp(nil, nil, nil, pass: nil)
    }
}
