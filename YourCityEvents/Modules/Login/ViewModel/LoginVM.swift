//
//  LoginVM.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/15/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import Foundation
enum PLoginVCState {
    case cleanLogin
    case cleanRegistration
}

class LoginVM: PLoginVM {
    
    func signUpPressed() {
        Router.showSignUpController()
    }
    
    var callback: ((PLoginVCState) -> Void)?
    func loginUser(_ login: String?, pass: String?) {
        Router.showTabBarController()
    }
}
