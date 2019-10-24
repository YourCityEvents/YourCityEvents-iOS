//
//  MainTabController.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 10/24/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import UIKit

class MainTabController: UITabBarController {
    
    private struct TabScreen {
        //let name: String
        let icon: UIImage?
        let viewController: UIViewController
    }
    
    private lazy var screens: [TabScreen] = {
        return [TabScreen(icon: UIImage(named: "home"), viewController: UIViewController()),
                TabScreen(icon: UIImage(named: "add"), viewController: UIViewController()),
                TabScreen(icon: UIImage(named: "profile"), viewController: UIViewController())]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAppearence()
        loadScreens()
    }
    
    private func configureAppearence() {
        view.backgroundColor = .white
//        tabBar.tintColor = UIColor.navigationGray
//        tabBar.unselectedItemTintColor = UIColor.lightGray
    }
    
    private func loadScreens() {
        setViewControllers(screens.map({ (screen) -> UIViewController in
            let nvc = UINavigationController(rootViewController: screen.viewController)
            nvc.navigationBar.barStyle = .default
            nvc.navigationBar.isTranslucent = false
//            nvc.navigationBar.barTintColor = UIColor.navigationGray
            nvc.tabBarItem = UITabBarItem(title: "", image: screen.icon, selectedImage: nil)
            return nvc
        }), animated: false)
    }
    
}

