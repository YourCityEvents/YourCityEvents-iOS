//
//  SignUpVM.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/15/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import Foundation

class SignUpVM: PSignUpVM {
    
    private let networking = NetworkingService()
    var callback: (() -> Void)?
    var callBackOnError: ((Error) -> ())?

    func signUp(_ firstName: String?, _ lastName: String?,_ email: String?, pass: String?) {
        let emailValidator = EmailValidator()
        let passwordValidator = PasswordValidator()
        let commonValidator = CommonValidator()
        
        guard emailValidator.validate(email) && passwordValidator.validate(pass) && commonValidator.validate(firstName) && commonValidator.validate(lastName) else {
            let error = NSError(domain:"", code:401, userInfo:[NSLocalizedDescriptionKey: "Fill all fields"])
            DispatchQueue.main.async {
                self.callBackOnError?(error)
            }
            return
        }
        
        let city = CityModel(id: "5dcfdf731822562bacb524c1", nameEn: "Kyiv", nameUa: "Київ")
        let model = RegisterModel(firstName: firstName ?? "", lastName: lastName ?? "", email: email ?? "", password: pass ?? "", city: city)

        networking.performRequest(to: EndpointCollection.register, with: model) { [weak self] (result: Result<AuthResponse>) in
            switch result {
            case .success(let response):
                print(response)
                DispatchQueue.main.async {
                    self?.callback?()
                    User.save(model: UserModel(login: email ?? "", password: pass ?? "", token: response.token))
                    Router.showTabBarController()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.callBackOnError?(error)
                }
            }
        }
    }
}
