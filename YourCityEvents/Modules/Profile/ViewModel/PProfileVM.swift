//
//  PProfileVM.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/18/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import UIKit

protocol PProfileVM: PViewControllerViewModel {
    var callBackOnUserModel: ((_ user: UserModel) -> ())? { get set }
    var callBackOnImage: ( (_ image: UIImage) -> ())? { get set }
    func showEditProfile()
    func getUserModel()
}
