//
//  SignUpVM.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/15/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import Foundation

class SignUpVM: PSignUpVM {
    var callback: ((PLoginVCState) -> Void)?
    
    func signUp(_ firstName: String?, _ lastName: String?,_ email: String?, pass: String?) {
        Router.showTabBarController()
    }
}
