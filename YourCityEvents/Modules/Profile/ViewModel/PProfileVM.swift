//
//  PProfileVM.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/18/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import UIKit

protocol PProfileVM: PTableViewModel {
    var callBackOnUserModel: ((_ user: UserModel) -> ())? { get set }
    var callBackOnImage: ((_ image: UIImage) -> ())? { get set }
    var callBackOnError: ((_ error: Error) -> ())? { get set }
    var callBackOnDelete: (() -> ())? { get set }
    var callBackOnUpdateDataSource: (() -> ())? { get set }
    func deleteEvent(for indexPath: Int)
    func showEditProfile()
    func getUserModel()
}
