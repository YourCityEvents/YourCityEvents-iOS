//
//  PasswordValidator.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/15/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import Foundation

class PasswordValidator: PValidator {
    private static let predicate = NSPredicate(format: "SELF MATCHES %@",
                                            "^(?=.*[0-9])(?=.*[A-Z])(?=.*[a-z])[0-9A-Za-z!@#$%?]{8,20}$")
    
    func validate(_ text: String?) -> Bool {
        guard let currentText = text else { return false }
        guard currentText.count >= 8 else { return false }
        guard PasswordValidator.predicate.evaluate(with: currentText) else { return false }
        guard !currentText.isEmpty else { return false }
        return true
    }
}
