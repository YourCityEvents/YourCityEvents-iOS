//
//  PAvatarCellVM.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/18/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import UIKit

protocol PAvatarCellVM: PTableViewCellModel {
    var callBackOnPicker: (()->()) { get set }
    func onTap()
    func getImage() -> UIImage
}
