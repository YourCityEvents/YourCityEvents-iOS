//
//  PEditProfileVM.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/18/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import UIKit

protocol PEditProfileVM: PTableViewModel {
    var callBackOnPicker: (()->())? { get set }
    var callBackOnUpdateDataSource: (()->())? { get set }
    var callBackOnLogOut: (()->())? { get set }
    var callBackOnShowHud: (() -> ())? {get set}
    var callBackOnDismissHud: (() -> ())? {get set}
    func updateWith(_ image: UIImage)
}
