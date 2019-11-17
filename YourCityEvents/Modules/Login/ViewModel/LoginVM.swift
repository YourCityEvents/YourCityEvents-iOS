//
//  LoginVM.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/15/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import Foundation

class LoginVM: PLoginVM {
    
    fileprivate let networking = NetworkingService()
    var callbackOnError: ((Error) -> ())?
    var callback: (() -> Void)?
    var callBackOnShowHud: (() -> ())?
    var callBackOnDismissHud: (() -> ())?
    func signUpPressed() {
        Router.showSignUpController()
    }
    
    func loginUser(_ login: String?, pass: String?) {
        let emailValidator = EmailValidator()
        let passwordValidator = PasswordValidator()
        if !emailValidator.validate(login) || !passwordValidator.validate(pass) {
            let error = NSError(domain:"", code:401, userInfo:[NSLocalizedDescriptionKey: "Please, enter login and password first"])
            callbackOnError?(error)
        }else {
            callBackOnShowHud?()
            let model = LoginModel(email: login!, password: pass!)
            networking.performRequest(to: EndpointCollection.login, with: model) { [weak self] (result: Result<AuthResponse>) in
                self?.callBackOnDismissHud?()
                switch result {
                case .success(let response):
                    DispatchQueue.main.async {
                        User.save(model: UserModel(login: model.email, password: model.password, token: response.token))
                        Router.showTabBarController()
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        self?.callbackOnError?(error)
                    }
                }
            }
        }
    }
}
