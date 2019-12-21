//
//  ProfileVC.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 10/27/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import UIKit
import SVProgressHUD

class ProfileVC: TableViewController {
    
//    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

}

extension ProfileVC {
    
    fileprivate func configure() {
        guard var model = viewModel as? PProfileVM else {
            return
        }
        SVProgressHUD.show()
        headerView.isHidden = true
        tableView.isHidden = true
        profileImageView.cornerRadius = 40
        model.getUserModel()
        profileImageView.contentMode = .scaleAspectFill
        model.callBackOnUpdateDataSource = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        model.callBackOnError = { [weak self] error in
            DispatchQueue.main.async {
                self?.show(error: error)
            }
        }
        model.callBackOnUserModel = { [weak self] model in
            DispatchQueue.main.async {
                SVProgressHUD.dismiss()
                self?.fullNameLabel.text = model.fullName
                self?.cityLabel.text = model.city.nameEn
                self?.headerView.isHidden = false
                self?.tableView.isHidden = false
                self?.tableView.reloadData()
            }
        }
        model.callBackOnImage = { [weak self] image in
            DispatchQueue.main.async {
                self?.profileImageView.image = image
            }
        }
        configureTableView()
    }
    
    fileprivate func configureTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 2.0
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    
}

//MARK: - Actions
extension ProfileVC {
    
    @IBAction func editAction() {
        guard let model = viewModel as? ProfileVM else { return }
        model.showEditProfile()
    }
}

extension ProfileVC {
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            print(indexPath.row)
            guard let model = viewModel as? ProfileVM else { return }
            model.deleteEvent(for: indexPath.row)
        }
    }
}

