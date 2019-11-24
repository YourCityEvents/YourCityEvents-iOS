//
//  ProfileVM.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/18/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import Foundation

class ProfileVM: PProfileVM {
    
    
    
    var callBackOnUserModel: ((UserModel) -> ())?
    private let networking = NetworkingService()
    
    func getUserModel() {
         networking.performRequest(to: EndpointCollection.getUser) { [weak self] (result: Result<UserResponseModel>) in
            switch result {
            case .success(let response):
                self?.callBackOnUserModel?(response.user)
            case .failure(_):
                break
            }
        }
    }
    
    func showEditProfile() {
        Router.showEditProfile()
    }
}
