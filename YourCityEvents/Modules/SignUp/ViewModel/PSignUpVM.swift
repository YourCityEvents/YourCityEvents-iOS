//
//  PSignUpVM.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/15/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import Foundation

protocol PSignUpVM: PViewControllerViewModel {
    var callBackOnError: ((_ error: Error) -> ())? {get set}
    var callback: (() -> ())? { get set }
    func signUp(_ firstName: String?, _ lastName: String?,_ email: String?, pass: String?)
}
