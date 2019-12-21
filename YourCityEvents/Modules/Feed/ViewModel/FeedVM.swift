//
//  FeedVM.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/16/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import Foundation

class FeedVM: PFeedVM {
    
    var onUpdateDataSource: (() -> ())?
    var onError: ((Error) -> ())?
    private let networking = NetworkingService()
    
    var sourceArray: [PTableViewCellModel] = []
    
    func getFeed() {
        networking.performRequest(to: EndpointCollection.getEvents) { [weak self] (result: Result<EventsModelResponse>) in
            switch result {
            case .success(let response):
                self?.sourceArray.removeAll()
                for event in response.events {
                    let vm = FeedCellModel(event) { (selectedModel) in
                        Router.showEventDetailsVC(selectedModel)
                    }
                    self?.sourceArray.append(vm)
                }
                self?.onUpdateDataSource?()
            case .failure(let error):
                self?.onError?(error)
            }
        }
    }
}
