//
//  ProfileVM.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/18/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import UIKit

class ProfileVM: PProfileVM {
    var callBackOnImage: ((UIImage) -> ())?
    var callBackOnUserModel: ((UserModel) -> ())?
    private let networking = NetworkingService()
    private var user: UserModel!
    
    func getUserModel() {
         networking.performRequest(to: EndpointCollection.getUser) { [weak self] (result: Result<UserResponseModel>) in
            switch result {
            case .success(let response):
                self?.callBackOnUserModel?(response.user)
                self?.user = response.user
                self?.updateUserModel()
                self?.downloadImage(self?.user.imageUrl)
            case .failure(_):
                break
            }
        }
    }
    
    func updateUserModel() {
        let userCached: UserCached? = DataBase.getUser(with: user.id)
        if let userCached = userCached, let data = userCached.imageData, let image = UIImage(data: data) {
            callBackOnImage?(image)
        }
    }
    
    func showEditProfile() {
        Router.showEditProfile(user)
    }
    
    private func downloadImage(_ stringUrl: String?) {
        guard let stringUrl = stringUrl, let url = URL(string: stringUrl) else { return }
        let dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                self?.callBackOnImage?(image)
                let _ = DataBase.newUser(userId: self?.user.id ?? "", fullname: self?.user.fullName ?? "", image: image)
                DataBase.saveContext()
            }
        }
        dataTask.resume()
    }
}
