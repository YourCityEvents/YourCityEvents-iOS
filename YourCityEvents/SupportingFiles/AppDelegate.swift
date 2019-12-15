//
//  AppDelegate.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 10/21/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import UIKit
import CoreData
import IQKeyboardManagerSwift

let DataBase = CoreDataStack()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = Router.createRootWindow()
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.toolbarPreviousNextAllowedClasses.append(UIStackView.self)
        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        DataBase.saveContext()
    }
}

