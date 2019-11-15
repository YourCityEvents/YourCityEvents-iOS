//
//  EmailValidator.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/15/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import Foundation

class EmailValidator: PValidator {
    private static let predicate = NSPredicate(format: "SELF MATCHES %@",
                                               "^[a-z0-9_+-]+(?:\\.[a-z0-9_+-]+)*@(?:[a-z0-9](?:[a-z0-9-_]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$")
    func validate(_ text: String?) -> Bool {
        guard let currentText = text else { return false }
        guard EmailValidator.predicate.evaluate(with: text) else { return false }
        guard !currentText.isEmpty else { return false }
        return true
    }
}
