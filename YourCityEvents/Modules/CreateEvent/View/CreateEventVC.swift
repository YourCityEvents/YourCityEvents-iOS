//
//  CreateEventVC.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 12/1/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import UIKit
import SVProgressHUD

class CreateEventVC: ViewController {
    
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var titleInputView: InputView! {didSet {titleInputView.validator = CommonValidator()}}
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var locationInputView: InputView! {didSet {locationInputView.validator = CommonValidator()}}
    @IBOutlet weak var priceInputView: InputView!
    @IBOutlet weak var startTimeTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!

    private lazy var imagePicker = ImagePicker(presentationController: self, delegate: self)
    private let timeDatePicker = UIDatePicker()
    private let datePicker = UIDatePicker()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        guard var model = viewModel as? PCreateEventVM else { return }
        model.callBackOnShowHud = {
            DispatchQueue.main.async {
                SVProgressHUD.show()
            }
        }
        model.callBackOnDismissHud = {
            DispatchQueue.main.async {
                SVProgressHUD.dismiss()
            }
        }
        model.callBackOnClearFields = { [weak self] in
            DispatchQueue.main.async {
                self?.eventImageView.image = UIImage(named: "event_icon")
                self?.titleInputView.tfContent.text = nil
                self?.descriptionTextView.text = nil
                self?.locationInputView.tfContent.text = nil
                self?.priceInputView.tfContent.text = nil
                self?.dateTextField.text = nil
                self?.startTimeTextField.text = nil
            }
        }
        
        timeDatePicker.datePickerMode = UIDatePicker.Mode.time
        timeDatePicker.locale = Locale(identifier: "en_GB")
        timeDatePicker.addTarget(self, action: #selector(timePickerChangedValue(_:)), for: .valueChanged)
        
        startTimeTextField.layer.cornerRadius = 4
        startTimeTextField.inputView = timeDatePicker
        startTimeTextField.textAlignment = .center
        
        datePicker.addTarget(self, action: #selector(datePickerChangedValue(_:)), for: .valueChanged)
        datePicker.datePickerMode = UIDatePicker.Mode.date
        
        dateTextField.layer.cornerRadius = 4
        dateTextField.inputView = datePicker

        contentView.layer.cornerRadius = 8
        contentView.layer.maskedCorners = [CACornerMask.layerMaxXMinYCorner, CACornerMask.layerMinXMinYCorner]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction func addEventPhotoAction() {
        imagePicker.present(from: self.view)
    }
    
    @IBAction func createEvent() {
        guard let model = viewModel as? PCreateEventVM else { return }
        model.createEvent(title: titleInputView.text, description: descriptionTextView.text, startTime: startTimeTextField.text, startDate: dateTextField.text, detailLocation: locationInputView.text, price: priceInputView.text)
    }
    
    @objc func timePickerChangedValue(_ picker: UIDatePicker) {
        startTimeTextField.text = UTCToLocalHours(date: picker.date)
    }
    
    @objc func datePickerChangedValue(_ picker: UIDatePicker) {
        dateTextField.text = UTCToLocalDate(date: picker.date)
    }
    
    private func UTCToLocalHours(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }
    
    private func UTCToLocalDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: date)
    }

}

extension CreateEventVC: ImagePickerDelegate {
    func didSelect(image: UIImage?) {
        guard let image = image, let model = viewModel as? PCreateEventVM else { return }
        model.uploadImage(image)
        eventImageView.image = image
    }
}
