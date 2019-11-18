//
//  EditProfileVC.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/18/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import UIKit

class EditProfileVC: TableViewController {
    
    private lazy var imagePicker = ImagePicker(presentationController: self, delegate: self)

    override func viewDidLoad() {
        configure()
    }
    
}

extension EditProfileVC {
    
    private func configure() {
        guard var model = viewModel as? PEditProfileVM else { return }
        configureTableView()
        model.callBackOnPicker = { [weak self] in
            self?.imagePicker.present(from: self?.view ?? UIView())
        }
        model.callBackOnUpdateDataSource = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    fileprivate func configureTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 2.0
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension EditProfileVC {
    
    @IBAction func closeAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func editAction() {
        
    }
}

extension EditProfileVC: ImagePickerDelegate {
    func didSelect(image: UIImage?) {
        guard let image = image, let model = viewModel as? PEditProfileVM else { return }
        model.updateWith(image)
    }
}
