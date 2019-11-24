//
//  PProfileVM.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/18/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import Foundation

protocol PProfileVM: PViewControllerViewModel {
    var callBackOnUserModel: ((_ user: UserModel) -> ())? { get set }
    func showEditProfile()
    func getUserModel() 
}
