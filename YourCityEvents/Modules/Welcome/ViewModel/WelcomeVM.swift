//
//  WelcomeVM.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/15/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import Foundation

class WelcomeVM: PWelcomeVM {
    private let networking = NetworkingService()
    func startFlow() {
        if let user = User.current {
            let model = LoginModel(email: user.login, password: user.password)
            networking.performRequest(to: EndpointCollection.login, with: model) { [weak self] (result: Result<AuthResponse>) in
                switch result {
                case .success(let response):
                    User.update(token: response.token)
                    DispatchQueue.main.async {
                        Router.showTabBarController()
                    }
                case .failure(_):
                    DispatchQueue.main.async {
                        Router.showLoginInController()
                    }
                }
            }
        } else {
            DispatchQueue.main.async {
                Router.showLoginInController()
            }
        }
    }
}
