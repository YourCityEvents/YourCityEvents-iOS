//
//  ProfileVM.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/18/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import UIKit

class ProfileVM: PProfileVM {
    var callBackOnUpdateDataSource: (() -> ())?
    var callBackOnDelete: (() -> ())?
    var callBackOnError: ((Error) -> ())?
    var callBackOnImage: ((UIImage) -> ())?
    var callBackOnUserModel: ((UserModel) -> ())?
    private let networking = NetworkingService()
    private var user: UserModel!
    var sourceArray: [PTableViewCellModel] = []
        
    func getUserModel() {
         networking.performRequest(to: EndpointCollection.getUser) { [weak self] (result: Result<UserResponseModel>) in
            switch result {
            case .success(let response):
                if let events = response.user.hostingEvents {
                    for event in events {
                        let vm = FeedCellModel(event) { (event) in
                        }
                        self?.sourceArray.append(vm)
                    }
                }
                self?.callBackOnUserModel?(response.user)
                self?.user = response.user
                self?.updateUserModel()
                self?.downloadImage(self?.user.imageUrl)
            case .failure(let error):
                self?.callBackOnError?(error)
            }
        }
    }
    
    func deleteEvent(for indexPath: Int) {
        guard let event = sourceArray[indexPath] as? FeedCellModel else { return }
        networking.performRequest(to: EndpointCollection.deleteEvent(with: event.content.id ?? "")) { [weak self] (result: Result<Empty>) in
            switch result {
            case .success(_):
                self?.sourceArray.remove(at: indexPath)
                self?.callBackOnUpdateDataSource?()
            case .failure(let error):
                self?.callBackOnError?(error)
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
