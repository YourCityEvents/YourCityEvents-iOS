//
//  CommonValidator.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/15/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import Foundation

class CommonValidator: PValidator {
    func validate(_ text: String?) -> Bool {
        guard let currentText = text else { return false }
        guard !currentText.isEmpty else { return false }
        return true
    }
}
