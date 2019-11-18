//
//  ChangeProfileVM.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/18/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import Foundation
enum ChangeProfileType {
    case email, password
}

class ChangeProfileVM: PChangeProfileVM {
    
    let type: ChangeProfileType
    
    init(_ type: ChangeProfileType) {
        self.type = type
    }
}
