//
//  ChangeProfileVM.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/18/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import Foundation
enum ChangeProfileType {
    case email, password
}

class ChangeProfileVM: PChangeProfileVM {
    
    var callBackOnShowHud: (() -> ())?
    var callBackOnDismissHud: (() -> ())?
    var callBackOnError: ((Error) -> ())?
    let type: ChangeProfileType
    private let networking = NetworkingService()

    init(_ type: ChangeProfileType) {
        self.type = type
    }
    
    func updatePassword(_ currentPassword: String?, _ newPassword: String?) {
        guard let currentPass = currentPassword, let newPass = newPassword else {
            return
        }
        callBackOnShowHud?()
        let model = ChangePasswordModel(newPassword: newPass, password: currentPass)
        networking.performRequest(to: EndpointCollection.changePassword, with: model) { [weak self] (result: Result<Empty>) in
            self?.callBackOnDismissHud?()
            switch result {
            case .success(_):
                DispatchQueue.main.async {
                    User.update(password: model.newPassword)
                    Router.showEditProfile()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.callBackOnError?(error)
                }
            }
        }
    }
       
    func updateEmail(_ newEmail: String?, _ password: String?) {
        guard let pass = password, let email = newEmail else {
            return
        }
        callBackOnShowHud?()
        let model = ChangeEmailModel(newEmail: email, password: pass)
        networking.performRequest(to: EndpointCollection.changePassword, with: model) { [weak self] (result: Result<Empty>) in
            self?.callBackOnDismissHud?()
            switch result {
            case .success(_):
                DispatchQueue.main.async {
                    User.update(password: model.newEmail)
                    Router.showEditProfile()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.callBackOnError?(error)
                }
            }
        }
    }
}
