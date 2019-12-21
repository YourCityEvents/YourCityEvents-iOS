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
    
    var callBackOnShowHud: (() -> ())?
    var callBackOnDismissHud: (() -> ())?
    var callBackOnError: ((Error) -> ())?
    var callBackOnClearFields: (() -> ())?

    private var imageArray: String?
    
    func createEvent(title: String?, description: String?, startTime: String?, startDate: String?, detailLocation: String?, price: String?) {
        
        guard let title = title, let description = description, let startTime = startTime, let startDate = startDate, let location = detailLocation, let price = price else {
            let error = NSError(domain:"", code:401, userInfo:[NSLocalizedDescriptionKey: "Please, check all fields"])
            callBackOnError?(error)
            return
        }
    
        var model: CreateEventModel!
        let date = "\(startDate) \(startTime)"
        if let imageArray = imageArray {
            model = CreateEventModel(title: title, description: description, detailLocation: location, imageArray: imageArray, price: Int(price) ?? 0, date: date)
        }else {
            model = CreateEventModel(title: title, description: description, detailLocation: location, imageArray: nil, price: Int(price) ?? 0, date: date)
        }
        
        self.callBackOnShowHud?()
        networking.performRequest(to: EndpointCollection.createEvent, with: model) { [weak self] (result: Result<EventModelResponse>) in
            self?.callBackOnDismissHud?()
            switch result {
            case .success(let resp):
                print(resp)
                self?.callBackOnClearFields?()
            case .failure(let error):
                print(error)
                DispatchQueue.main.async {
                    self?.callBackOnError?(error)
                }
            }
        }
    }
    
    func uploadImage(_ image: UIImage) {
        let resizedImage = image.resized(toWidth: 700.0)
        let imageData = resizedImage!.jpegData(compressionQuality: 0.8)
        imageArray = imageData!.base64EncodedString(options: .lineLength64Characters)
    }
}
