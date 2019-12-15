//
//  PCreateEvent.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 12/1/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import UIKit

protocol PCreateEventVM: PViewControllerViewModel {
    var callBackOnError: ((_ error: Error)->())? { get set }
    var callBackOnShowHud: (() -> ())? { get set }
    var callBackOnDismissHud: (() -> ())? { get set }
//    var callBackOnPicker: (()->())? { get set }
    func uploadImage(_ image: UIImage)
    func createEvent(title: String?, description: String?, startTime: String?, startDate: String?, detailLocation: String?, price: String?) 
}
