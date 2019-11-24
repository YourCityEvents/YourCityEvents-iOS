//
//  PChangeProfileVM.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/18/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import Foundation

protocol PChangeProfileVM: PViewControllerViewModel {
    var callBackOnError: ((_ error: Error)->())? { get set }
    var callBackOnShowHud: (() -> ())? {get set}
    var callBackOnDismissHud: (() -> ())? {get set}
    func updatePassword(_ currentPassword: String?, _ newPassword: String?)
    func updateEmail(_ newEmail: String?, _ password: String?)
}
