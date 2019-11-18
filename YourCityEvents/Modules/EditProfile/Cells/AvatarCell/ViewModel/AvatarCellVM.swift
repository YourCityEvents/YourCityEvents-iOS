//
//  AvatarCellVM.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/18/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import UIKit

class AvatarCellVM: PAvatarCellVM {
    func getImage() -> UIImage { image }
    var callBackOnPicker: (() -> ())
    
    var needToUpdateCallback: (() -> Void)?
    var cellIdentifire: String = AvatarCell.getCellIdentifier()
    var cellHeight: Float = 100.0
    var image: UIImage
    
    init(image: UIImage, callBackOnTap: @escaping ()->()) {
        callBackOnPicker = callBackOnTap
        self.image = image
    }
    
    func onTap() {
        callBackOnPicker()
    }
}
