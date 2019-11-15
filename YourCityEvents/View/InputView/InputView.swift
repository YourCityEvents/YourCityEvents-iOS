//
//  InputView.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/15/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import UIKit

class InputView: XibView {
    @IBOutlet private weak var vWhite: UIView!
    @IBOutlet private weak var lErrorMassage: UILabel!
    @IBOutlet weak var tfContent: UITextField!
    @IBOutlet private weak var ivPrivace: UIImageView!
    @IBOutlet weak var lHelperText: UILabel!
    @IBOutlet weak var lcHelperTextWidth: NSLayoutConstraint!
    var validator: PValidator?
    @IBInspectable var needHelper: Bool = false {
        didSet {  lcHelperTextWidth.constant = needHelper ? 50.0 : 0.0 }
    }
    @IBInspectable var helperText: String? {
        set { lHelperText.text = newValue }
        get { return lHelperText.text ?? nil }
    }
    @IBInspectable var isPrivace: Bool {
        set { ivPrivace.isHidden = !newValue; tfContent.isSecureTextEntry = newValue }
        get { return !ivPrivace.isHidden }
    }
    @IBInspectable var placeholder: String {
        set { tfContent.placeholder = newValue }
        get { return tfContent.placeholder ?? "" }
    }
    @IBInspectable var text: String? {
        set { tfContent.text = newValue }
        get { return tfContent.text }
    }
    @IBInspectable var errorMessage: String? {
        set { lErrorMassage.text = newValue }
        get { return lErrorMassage.text }
    }
    override func commonInit() {
        super.commonInit()
        ivPrivace.addTapGestureRecognizer(target: self, action: #selector(changePrivace))
        tfContent.delegate = self
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    @objc private func changePrivace() {
        tfContent.isSecureTextEntry = !tfContent.isSecureTextEntry
    }
    func validateText(_ text: String?) {
        guard let currentValidator = validator else { return }
        currentValidator.validate(text) ? valideText() : notValideText()
    }
    func notValideText() {
//        vWhite.borderColor = UIColor.red
        vWhite.backgroundColor = .white
        lErrorMassage.isHidden = false
        ivPrivace.image = #imageLiteral(resourceName: "0.2RedEye.pdf")
    }
    func valideText() {
//        vWhite.
//        vWhite.borderColor = #colorLiteral(red: 0.8745098039, green: 0.8745098039, blue: 0.8745098039, alpha: 1)
        vWhite.backgroundColor = .white
        lErrorMassage.isHidden = true
        ivPrivace.image = #imageLiteral(resourceName: "0.2Eye.pdf")
    }
}

extension InputView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text, let textRange = Range(range, in: text) {
            validateText(text.replacingCharacters(in: textRange, with: string))
        }
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
        return true
    }
}
