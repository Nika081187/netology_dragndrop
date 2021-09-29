//
//  PostCoordinator.swift
//  Navigation
//
//  Created by v.milchakova on 13.02.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
final class PostCoordinator: Coordinator {

    private weak var navigationController: UINavigationController?
    private var infoCoordinator: InfoCoordinator
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
        infoCoordinator = InfoCoordinator(navigationController: navigationController)
    }
    
    func start() {
        let vc = PostViewController()
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

@available(iOS 13.0, *)
extension PostCoordinator: PostViewControllerDelegate {
    func onAddPostPressed() {
        infoCoordinator.start()
    }
}
