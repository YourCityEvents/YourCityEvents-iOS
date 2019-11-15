//
//  PLoginVM.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/15/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import Foundation

protocol PLoginVM: PViewControllerViewModel {
    var callback: ((PLoginVCState) -> Void)? { get set }
    func loginUser(_ login: String?, pass: String?)
    func signUpPressed()
}
