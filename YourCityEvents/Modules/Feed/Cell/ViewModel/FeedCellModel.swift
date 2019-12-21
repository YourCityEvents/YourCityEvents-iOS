//
//  File.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/16/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import UIKit

struct FeedCellModelObject {
    var name: String?
    var password: String?
    var descriptions: String?
}

class FeedCellModel: PFeedCellViewModel {
    func getImageUrl() -> String? { return content.imageUrl }
    func getStringDate() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yy HH:mm"
        dateFormatter.timeZone = TimeZone.current
        let date = dateFormatter.date(from: content.date)
        return dateFormatter.string(from: date!)
    }
    
    func onSelect() { select(content) }
    func getFeedName() -> String? { content.title }
    func getDescription() -> String? { content.description }
    var needToUpdateCallback: (() -> Void)?
    var cellIdentifire: String = FeedCell.getCellIdentifier()
    var cellHeight: Float = 140.0
    var content: EventModel
    private var select: ((EventModel) -> Void)
    
    init(_ cellContent: EventModel, selectedModel: @escaping ((EventModel) -> Void)) {
        content = cellContent
        select = selectedModel
    }
}
