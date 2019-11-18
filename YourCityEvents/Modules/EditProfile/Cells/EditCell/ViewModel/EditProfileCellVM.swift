//
//  EditCellVM.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/18/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import UIKit

struct EditProfileCellTypeInfo {
    let image: UIImage
    let title: String
    let isHiddenArrow: Bool
}
enum EditProfileCellType {
    case logout, changePassword, changeEmail, changeCity
}

class EditProfileCellVM: PEditProfileCellVM {
    
    func isHideArrow() -> Bool { info.isHiddenArrow }
    func getIcon() -> UIImage { info.image }
    func getTitle() -> String { info.title }
        
    var callBackOnType: ((EditProfileCellType) -> ())
    var needToUpdateCallback: (() -> Void)?
    var cellIdentifire: String = EditProfileCell.getCellIdentifier()
    var cellHeight: Float = 50.0
    var type: EditProfileCellType
    var info: EditProfileCellTypeInfo
   
    init(_ type: (EditProfileCellType, EditProfileCellTypeInfo), selectedType: @escaping ((EditProfileCellType) -> Void) ) {
        self.type = type.0
        self.info = type.1
        self.callBackOnType = selectedType
    }
    
    func onTap() {
        callBackOnType(type)
    }
}
