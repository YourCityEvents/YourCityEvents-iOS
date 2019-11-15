//
//  ViewController.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/15/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import UIKit

protocol PViewControllerViewModel { }

class ViewController: UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    /// First Layout Subviews
    private var isFirstLayoutSubviews: Bool = true
    /// View Model
    var viewModel: PViewControllerViewModel?
    //––––––––––––––––––––––––––––––––––––––––
    // MARK: - Init with coder -
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    //––––––––––––––––––––––––––––––––––––––––
    // MARK: - Deinit -
    deinit { debugPrint("🔻Deinit \(type(of: self))") }
    //––––––––––––––––––––––––––––––––––––––––
    // MARK: - Init -
    init() {
        super.init(nibName: String(describing: type(of: self)), bundle: Bundle.main)
        debugPrint("🔺Init \(type(of: self))")
    }
    // View Did Layout Subviews
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        guard isFirstLayoutSubviews else { return }
        isFirstLayoutSubviews = false
        viewWillFinishRendering()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.async { [weak self] in
            self?.navigationController?.navigationBar.isUserInteractionEnabled = false
            for item in self?.navigationController?.navigationBar.subviews ?? [] {
                item.isHidden = true
            }
        }
    }
    // view end rendering
    func viewWillFinishRendering() { }
    func setupContentView(contentVC: ViewController, contentVM: PViewControllerViewModel?, onView: UIView) {
        contentVC.viewModel = contentVM
        addChild(contentVC)
        onView.addSubview(contentVC.view)
        contentVC.view.frame = onView.bounds
        contentVC.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentVC.didMove(toParent: self)
    }
}
