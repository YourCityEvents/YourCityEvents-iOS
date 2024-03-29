//
//  Router.swift
//  YourCityEvents
//
//  Created by Yaroslav Zarechnyy on 11/15/19.
//  Copyright © 2019 Yaroslav Zarechnyy. All rights reserved.
//

import UIKit

class Router {
    
    static func createRootWindow() -> UIWindow {
        return Router.showScreenAsRoot(WelcomeVC(), viewModel: WelcomeVM())
    }
    
    private class func showScreenAsRoot(_ view: ViewController, viewModel: PViewControllerViewModel?) -> UIWindow {
        let window = UIWindow()
        view.viewModel = viewModel
        window.rootViewController = view
        window.makeKeyAndVisible()
        return window
    }
    
    static func getRootViewController() -> UIViewController? {
        return Thread.isMainThread ? getRoot() : DispatchQueue.main.sync { return getRoot() }
    }
    
    private static func getRoot() -> UIViewController? {
        guard let rootVC = UIApplication.shared.keyWindow?.rootViewController else { return nil }
        return Router.getLastPresentedViewController(rootVC)
    }
    
    private static func getLastPresentedViewController(_ viewController: UIViewController) -> UIViewController {
        guard let presentedViewController = viewController.presentedViewController else { return viewController }
        return Router.getLastPresentedViewController(presentedViewController)
    }
    
    static func showTabBarController() {
        let vc = MainTabController()
        setRoot(viewController: vc)
    }
    
    static func showSignUpController() {
        let vc = SignUpVC()
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        vc.viewModel = SignUpVM()
        setRoot(viewController: vc)
    }
    
    static func showEventDetailsVC(_ event: EventModel) {
        guard let viewC = Router.getRootViewController() as? UITabBarController else { return }
        guard let navVC = viewC.selectedViewController as? UINavigationController else { return }
        let vc = EventDetailsVC(EventDetailsVM(event))
        if let _ = navVC.topViewController as? FeedVC {
            navVC.pushViewController(vc, animated: true)
        }
    }
    
    static func showLoginInController() {
        let vc = LoginVC(LoginVM())
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        setRoot(viewController: vc)
    }
    
    static func showEditProfile(_ userModel: UserModel? = nil) {
        guard let viewC = Router.getRootViewController() as? UITabBarController else { return }
        guard let navVC = viewC.selectedViewController as? UINavigationController else { return }
        if let _ = navVC.topViewController as? ProfileVC {
            guard let user = userModel else { return }
            navVC.pushViewController(EditProfileVC(EditProfileVM(user)), animated: true)
        }else {
            navVC.popViewController(animated: true)
        }
    }
    
    static func showChangeController(_ type: ChangeProfileType) {
        guard let viewC = Router.getRootViewController() as? UITabBarController else { return }
        guard let navVC = viewC.selectedViewController as? UINavigationController else { return }
        guard let _ = navVC.topViewController as? EditProfileVC else {
            return
        }
        navVC.pushViewController(ChangeProfileVC(ChangeProfileVM(type)), animated: true)
    }
    
    static func dismissVC(_ block: (() -> Void)?) {
        guard let viewC = Router.getRootViewController() else { return }
        viewC.dismiss(animated: true, completion: block)
    }
    
    static func popVC(_ block: (() -> Void)?) {
        guard let viewC = Router.getRootViewController() as? UINavigationController else { return }
        viewC.popViewController(animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            block?()
        })
    }
    
    static func setRoot(viewController: UIViewController) {
        guard let window = (UIApplication.shared.delegate as! AppDelegate).window else {
            preconditionFailure("Can't get window")
        }
        guard window.rootViewController != viewController else {
            return
        }
    
        window.rootViewController = viewController
        
        let options: UIView.AnimationOptions = .transitionCrossDissolve
        let duration: TimeInterval = 0.3
        
        UIView.transition(with: window, duration: duration, options: options, animations: {}, completion: nil)
    }
    
    static func popToRootVC(_ block: (() -> Void)?) {
        guard let viewC = Router.getRootViewController() as? UINavigationController else { return }
        viewC.popToRootViewController(animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            block?()
        })
    }
}
