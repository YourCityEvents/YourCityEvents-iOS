//
//  SignUpBioVM.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/17/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import Foundation

class SignUpVM: PSignUpVM {
    
    fileprivate let networking = NetworkingService()
    var callBackOnScrollView: ((Int) -> ())?
    var onUpdateDataSource: (() -> ())?
    var callBackOnError: ((Error) -> ())?
    var callBackOnShowHud: (() -> ())?
    var callBackOnDismissHud: (() -> ())?
    fileprivate var login: String!
    fileprivate var password: String!
    fileprivate var firstName: String!
    fileprivate var lastName: String!
    var sourceArray: [PTableViewCellModel] = []
    
    func validateUserSensitiveData(_ login: String?, _ password: String?) {
        let emailValidator = EmailValidator()
        let passwordValidator = PasswordValidator()
        if !emailValidator.validate(login) || !passwordValidator.validate(password) {
            let error = NSError(domain:"", code:401, userInfo:[NSLocalizedDescriptionKey: "Please, enter login and password first"])
            callBackOnError?(error)
        }else {
            self.login = login
            self.password = password
            callBackOnScrollView?(1)
            getCities()
        }
    }
    
    func validateUserData(_ firstName: String?, _ lastName: String?) {
        let commonValidator = CommonValidator()
        if !commonValidator.validate(firstName) || !commonValidator.validate(lastName) {
            let error = NSError(domain:"", code:401, userInfo:[NSLocalizedDescriptionKey: "Fill all fields"])
            callBackOnError?(error)
        }else {
            self.firstName = firstName
            self.lastName = lastName
            callBackOnScrollView?(2)
        }
    }

    fileprivate func signUp(city: CityModel) {
        callBackOnShowHud?()
        guard let name = firstName, let lastName = lastName, let password = password, let email = login else {
            callBackOnDismissHud?()
            return
        }
        let model = RegisterModel(firstName: name, lastName: lastName, email: email, password: password, city: city)
        networking.performRequest(to: EndpointCollection.register, with: model) { [weak self] (result: Result<AuthResponse>) in
            self?.callBackOnDismissHud?()
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    User.save(model: UserSensitiveModel(login: model.email, password: model.password, token: response.token))
                    Router.showTabBarController()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.callBackOnError?(error)
                }
            }
        }
    }
    
    fileprivate func getCities() {
        networking.performRequest(to: EndpointCollection.getCities) { [weak self] (result: Result<CitiesResponse>) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    for city in response.cities {
                        let vm = CityCellVM(city) { (selectedCity) in
                            self?.signUp(city: city)
                        }
                        self?.sourceArray.append(vm)
                    }
                    self?.onUpdateDataSource?()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.callBackOnError?(error)
                }
            }
        }
    }
}
