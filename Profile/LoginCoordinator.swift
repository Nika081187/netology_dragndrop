//
//  LoginCoordinator.swift
//  Navigation
//
//  Created by v.milchakova on 13.02.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
final class LoginCoordinator: Coordinator {

    private weak var navigationController: UINavigationController?
    private var profileCoordinator: ProfileCoordinator
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
        profileCoordinator = ProfileCoordinator(navigationController: navigationController)
    }
    
    func start() {
        let vc = LogInViewController()
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

@available(iOS 13.0, *)
extension LoginCoordinator: LogInViewControllerDelegate {
    func onLogInPressed() {
        profileCoordinator.start()
    }
}
