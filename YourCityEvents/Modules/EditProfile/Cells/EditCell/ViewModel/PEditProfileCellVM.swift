//
//  PEditCellVM.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/18/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import UIKit

protocol PEditProfileCellVM: PTableViewCellModel {
    var callBackOnType: ((EditProfileCellType)->()) { get set }
    func onTap()
    func getIcon() -> UIImage
    func getTitle() -> String
    func isHideArrow() -> Bool
}
