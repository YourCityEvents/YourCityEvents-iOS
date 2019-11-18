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
        return [TabScreen(icon: UIImage(named: "home"), viewController: FeedVC(FeedVM())),
                TabScreen(icon: UIImage(named: "add"), viewController: UIViewController()),
                TabScreen(icon: UIImage(named: "profile"), viewController: ProfileVC(ProfileVM()))]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadScreens()
        configureAppearence()
    }
    
    private func configureAppearence() {
        view.backgroundColor = .white
        let image = UIImage().createSelectionIndicator(color: UIColor.appBlue,
                                                       size: CGSize(width: tabBar.frame.width/CGFloat(tabBar.items!.count), height: tabBar.frame.height-1),
                                                       lineWidth: 2)
        
        
        tabBar.selectionIndicatorImage = image.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
    }
    
    private func loadScreens() {
        setViewControllers(screens.map({ (screen) -> UIViewController in
            let nvc = UINavigationController(rootViewController: screen.viewController)
            nvc.navigationBar.barStyle = .default
            nvc.navigationBar.isTranslucent = false
            nvc.tabBarItem = UITabBarItem(title: nil, image: screen.icon, selectedImage: nil)
            return nvc
        }), animated: false)
    }
    
}

