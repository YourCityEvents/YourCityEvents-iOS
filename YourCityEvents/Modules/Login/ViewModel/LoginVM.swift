//
//  LoginVM.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/15/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import Foundation

class LoginVM: PLoginVM {
    
    var callbackOnError: ((Error) -> ())?
    var callback: (() -> Void)?
    
    func signUpPressed() {
        Router.showSignUpController()
    }
    
    func loginUser(_ login: String?, pass: String?) {
//        let emailValidator = EmailValidator()
//        let passwordValidator = PasswordValidator()
//        if !emailValidator.validate(login) || !passwordValidator.validate(pass) {
//            let error = NSError(domain:"", code:401, userInfo:[NSLocalizedDescriptionKey: "Please, enter login and password first"])
//            callbackOnError?(error)
//        }else {
            Router.showTabBarController()
//        }
    }
}
