//
//  File.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/16/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import Foundation

struct FeedCellModelObject {
    var name: String?
    var password: String?
    var descriptions: String?
}

class FeedCellModel: PFeedCellViewModel {
    func onSelect() {
        select(content)
    }
    func getFeedName() -> String? { content.name }
    func getDescription() -> String? { content.descriptions }
    var needToUpdateCallback: (() -> Void)?
    var cellIdentifire: String = FeedCell.getCellIdentifier()
    var cellHeight: Float = 140.0
    var content: FeedCellModelObject
    private var select: ((FeedCellModelObject) -> Void)
    
    init(_ cellContent: FeedCellModelObject, selectedModel: @escaping ((FeedCellModelObject) -> Void)) {
        content = cellContent
        select = selectedModel
    }
}
