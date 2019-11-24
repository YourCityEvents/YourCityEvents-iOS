//
//  ProfileVC.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 10/27/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import UIKit
import SVProgressHUD

class ProfileVC: ViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var bioTextView: UITextView!
    @IBOutlet weak var headerView: UIView!
    
    
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
        model.getUserModel()
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
        print("edit")
    }
}

extension ProfileVC: UITableViewDelegate {
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ProfileVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 30))
        view.backgroundColor = .white
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Organizes"
        label.textColor = .black
        view.addSubview(label)
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: UserCell.reuseIdentifier, for: indexPath)
        return UITableViewCell()
    }
}
