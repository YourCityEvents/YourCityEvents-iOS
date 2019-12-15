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
    private let networking = NetworkingService()
    
    var sourceArray: [PTableViewCellModel] = []
    init() {
        self.sourceArray.removeAll()
        for item in CredentialsHelper.getListNew() {
            let vm = FeedCellModel(item) { (model) in
                print(model)
                Router.showEventDetailsVC()
//                showEventDetailsVC
            }
            self.sourceArray.append(vm)
        }
        self.onUpdateDataSource?()
    }
    
    func getFeed() {
        networking.performRequest(to: EndpointCollection.getEvents) { [weak self] (result: Result<EventsModelResponse>) in
            switch result {
            case .success(let response):
                print(response.events)
            case .failure(let error):
                print(error)
            }
        }
    }
}


class CredentialsHelper {
    class func getList() -> [FeedCellModelObject] {
        return [FeedCellModelObject(name: "test",descriptions: "descrep"),
                FeedCellModelObject(name: "teeeest",descriptions: "descrep")]
    }
    
    class func getListNew() -> [FeedCellModelObject] {
        return [FeedCellModelObject(name: "test",descriptions: "descrep"),
                FeedCellModelObject(name: "teeeest",descriptions: "descrep"),
                FeedCellModelObject(name: "test",descriptions: "descrep"),
                FeedCellModelObject(name: "test",descriptions: "descrep")]
    }
}
