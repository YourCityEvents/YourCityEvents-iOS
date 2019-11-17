//
//  SignUpVC.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/17/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import UIKit
import SVProgressHUD

class SignUpVC: TableViewController {
    
    @IBOutlet weak var firstNameInputView: InputView! {didSet {firstNameInputView.validator = CommonValidator()}}
    @IBOutlet weak var lastNameInputView: InputView! {didSet {lastNameInputView.validator = CommonValidator()}}
    @IBOutlet weak var passwordInputView: InputView! {didSet {passwordInputView.validator = PasswordValidator()}}
    @IBOutlet weak var loginInputView: InputView! {didSet {loginInputView.validator = EmailValidator()}}
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var firstProgressView: ProgressStepsView!
    @IBOutlet weak var secondProgressView: ProgressStepsView!
    @IBOutlet weak var thirdProgressView: ProgressStepsView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        guard var model = viewModel as? PSignUpVM else { return }
        
        firstProgressView.configure(with: ["Login", "Bio", "Your city"], activeIndex: 0)
        secondProgressView.configure(with: ["Login", "Bio", "Your city"], activeIndex: 1)
        thirdProgressView.configure(with: ["Login", "Bio", "Your city"], activeIndex: 2)
        configureTableView()
        
        model.callBackOnShowHud = {
            SVProgressHUD.show()
        }
        
        model.callBackOnDismissHud = {
            SVProgressHUD.dismiss()
        }

        model.callBackOnError = { [weak self] error in
            self?.show(error: error)
        }
        
        model.onUpdateDataSource = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        model.callBackOnScrollView = { [weak self] index in
            guard let width = self?.view.frame.width else {
                return
            }
            switch index {
            case 1:
                self?.scrollView.isPagingEnabled = true
                self?.scrollView.isScrollEnabled = true
                self?.scrollView.setContentOffset(CGPoint(x: width, y: 0), animated: true)
            case 2:
                self?.scrollView.setContentOffset(CGPoint(x: width * 2, y: 0), animated: true)
            default: break
            }
        }
    }
    
    fileprivate func configureTableView() {
        tableView.rowHeight = 50.0
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.delegate = self
        tableView.dataSource = self
    }
}

//MARK: - Actions
extension SignUpVC {
    @IBAction func nextAction(_ sender: UIButton) {
        guard let model = viewModel as? PSignUpVM else { return }
        switch sender.tag {
        case 0:
            model.validateUserSensitiveData(loginInputView.text, passwordInputView.text)
        case 1:
            model.validateUserData(firstNameInputView.text, lastNameInputView.text)
        default: break
        }
    }
    @IBAction func backToLoginAction() {
        Router.showLoginInController()
    }
}
