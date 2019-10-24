//
//  SignUpVC.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 10/24/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//MARK: - Actions
extension SignUpVC {
    
    @IBAction func signUpButtonPressed() {
        self.present(MainTabController(), animated: true)
    }
}
