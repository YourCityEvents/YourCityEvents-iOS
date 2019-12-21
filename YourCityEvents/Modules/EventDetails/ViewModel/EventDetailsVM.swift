//
//  EventDetailsVM.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 12/21/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import Foundation

class EventDetailsVM: PEventDetailsVM {
    
    let event: EventModel
    var callBackOnModel: ((EventModel) -> ())?

    init(_ event: EventModel) {
        self.event = event
    }
    
    func onLoad() {
        callBackOnModel?(event)
    }
}
