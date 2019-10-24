//
//  LoginVC.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 10/24/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//MARK: - Actions
extension LoginVC {
    
    @IBAction func signUpButtonPressed() {
        self.present(SignUpVC(), animated: true)
    }
    
    @IBAction func loginButtonPressed() {
        //        self.present(<#T##viewControllerToPresent: UIViewController##UIViewController#>, animated: <#T##Bool#>, completion: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
    }

}

