//
//  MainCoordinator.swift
//  Navigation
//
//  Created by v.milchakova on 13.02.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
final class MainCoordinator: Coordinator {
    
    let window: UIWindow
    let navigationController: UINavigationController
    let myTabBarCoordinator: MyTabBarCoordinator
      
    init(window: UIWindow) {
        self.window = window
        navigationController = UINavigationController()
        myTabBarCoordinator = MyTabBarCoordinator(navigationController: navigationController)
    }
    
    func start() {
        window.rootViewController = navigationController
        myTabBarCoordinator.start()
        window.makeKeyAndVisible()
    }
}

@available(iOS 13.0, *)
final class MyTabBarCoordinator: Coordinator {
    
    private weak var navigationController: UINavigationController?
    private var feedCoordinator: FeedCoordinator
    private var logInCoordinator: LoginCoordinator
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
        feedCoordinator = FeedCoordinator(navigationController: navigationController)
        logInCoordinator = LoginCoordinator(navigationController: navigationController)
    }
    
    func start() {
        let vc = MyTabBarController()
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

@available(iOS 13.0, *)
extension MyTabBarCoordinator: MyTabBarControllerDelegate {
    func myTabBarControllerItemSelected(_ name: String) {
        switch name {
        case "Feed":
            feedCoordinator.start()
        case "Profile":
            logInCoordinator.start()
        default:
            fatalError("Unknown tab bar item!")
        }
    }
}
