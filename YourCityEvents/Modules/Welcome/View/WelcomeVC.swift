//
//  ViewController.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 10/21/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import UIKit

class WelcomeVC: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.route()
        }
    }
    
    private func route() {
        guard let model = viewModel as? WelcomeVM else {
            return
        }
        model.startFlow()
    }
}

