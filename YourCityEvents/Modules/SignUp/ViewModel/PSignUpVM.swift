//
//  File.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/17/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import Foundation

protocol PSignUpVM: PTableViewModel {
    func validateUserSensitiveData(_ login: String?, _ password: String?)
    func validateUserData(_ firstName: String?, _ lastName: String?)
    var callBackOnScrollView: ((Int) -> ())? {get set}
    var onUpdateDataSource: (() -> ())? {get set}
    var callBackOnError: ((_ error: Error) -> ())? {get set}
    var callBackOnShowHud: (() -> ())? {get set}
    var callBackOnDismissHud: (() -> ())? {get set}
}
