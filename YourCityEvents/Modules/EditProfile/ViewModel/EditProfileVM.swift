//
//  EditProfileVM.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/18/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import UIKit

class EditProfileVM: PEditProfileVM {
    
    var callBackOnShowHud: (() -> ())?
    var callBackOnDismissHud: (() -> ())?
    var callBackOnLogOut: (() -> ())?
    var callBackOnUpdateDataSource: (() -> ())?
    var callBackOnPicker: (() -> ())?
    var currentUserImage = UIImage(named: "editPhoto")
    var sourceArray: [PTableViewCellModel] = []
    
    init() {
        let vm = AvatarCellVM(image: currentUserImage!) { [weak self] in
            self?.callBackOnPicker?()
        }
        sourceArray.append(vm)
        
        var type = (EditProfileCellType.changeCity ,EditProfileCellTypeInfo(image: UIImage(named: "key")!, title: "Change city", isHiddenArrow: false))
        let cityVM = EditProfileCellVM(type) { (selected) in

        }
        
        type = (EditProfileCellType.changeEmail ,EditProfileCellTypeInfo(image: UIImage(named: "mail")!, title: "Change email", isHiddenArrow: false))
        let emailVM = EditProfileCellVM(type) { (selected) in
            DispatchQueue.main.async {
                Router.showChangeController(.email)
            }
        }
        
        type.0 = .changePassword
        type.1 = EditProfileCellTypeInfo(image: UIImage(named: "key")!, title: "Change password", isHiddenArrow: false)
        let passVM = EditProfileCellVM(type) { (selected) in
            DispatchQueue.main.async {
                Router.showChangeController(.password)
            }
        }
        
        type.0 = .logout
        type.1 = EditProfileCellTypeInfo(image: UIImage(named: "logOut")!, title: "Logout", isHiddenArrow: true)
        let logoutVM = EditProfileCellVM(type) { [weak self] (selected) in
            
            self?.callBackOnLogOut?()
        }
        
        sourceArray.append(cityVM)
        sourceArray.append(emailVM)
        sourceArray.append(passVM)
        sourceArray.append(logoutVM)
    }
    
    func updateWith(_ image: UIImage) {
        currentUserImage = image
        sourceArray.removeFirst()
        let vm = AvatarCellVM(image: currentUserImage!) { [weak self] in
            self?.callBackOnPicker?()
        }
        sourceArray.insert(vm, at: 0)
        callBackOnUpdateDataSource?()
    }

}
