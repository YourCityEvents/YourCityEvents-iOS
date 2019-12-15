//
//  CreateEventVM.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 12/1/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import UIKit

class CreateEventVM: PCreateEventVM {
    
    private let networking = NetworkingService()
    
    var callBackOnError: ((Error) -> ())?
    
    var callBackOnShowHud: (() -> ())?
    
    var callBackOnDismissHud: (() -> ())?
    
    private var imageUrl: String?
    
    func createEvent(title: String?, description: String?, startTime: String?, startDate: String?, detailLocation: String?, price: String?) {
        
    }
    
    func uploadImage(_ image: UIImage) {
        print(image)
        callBackOnDismissHud?()
    }
}
