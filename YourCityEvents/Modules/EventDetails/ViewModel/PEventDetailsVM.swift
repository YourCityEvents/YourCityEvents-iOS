//
//  PEventDetailsVM.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 12/21/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import Foundation

protocol PEventDetailsVM: PViewControllerViewModel {
    var callBackOnModel: ((_ event: EventModel) -> ())? { get set }
    func onLoad() 
}
