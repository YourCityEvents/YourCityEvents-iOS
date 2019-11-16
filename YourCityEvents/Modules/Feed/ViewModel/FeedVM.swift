//
//  FeedVM.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/16/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import Foundation

class FeedVM: PFeedVM {
    var callback: (() -> ())?
    
    var sourceArray: [PTableViewCellModel] = []
    init() {
        for item in CredentialsHelper.getList() {
            let vm = FeedCellModel(item) { (model) in
                print(model)
            }
            sourceArray.append(vm)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.sourceArray.removeAll()
            for item in CredentialsHelper.getListNew() {
                let vm = FeedCellModel(item) { (model) in
                    print(model)
                }
                self.sourceArray.append(vm)
            }
            self.callback?()
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
