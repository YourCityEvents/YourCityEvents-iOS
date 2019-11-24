//
//  AvatarCellVM.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/18/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import UIKit

class AvatarCellVM: PAvatarCellVM {
    func getImage() -> UIImage? { image }
    func getStringUrl() -> String? { stringUrl }
    var callBackOnPicker: (() -> ())
    
    var needToUpdateCallback: (() -> Void)?
    var cellIdentifire: String = AvatarCell.getCellIdentifier()
    var cellHeight: Float = 100.0
    var stringUrl: String?
    var image: UIImage?
    
    init(_ url: String? = nil, _ image: UIImage? = nil, callBackOnTap: @escaping ()->()) {
        callBackOnPicker = callBackOnTap
        self.stringUrl = url
        self.image = image
    }
    
    
    
    func onTap() {
        callBackOnPicker()
    }
}
