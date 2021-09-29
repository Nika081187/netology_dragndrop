//
//  FeedCoordinator.swift
//  Navigation
//
//  Created by v.milchakova on 13.02.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
final class FeedCoordinator: Coordinator {

    private weak var navigationController: UINavigationController?
    private var postCoordinator: PostCoordinator
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
        postCoordinator = PostCoordinator(navigationController: navigationController)
    }
    
    func start() {
        let vc = FeedViewController()
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

@available(iOS 13.0, *)
extension FeedCoordinator: FeedViewControllerDelegate {
    func onOpenPostPressed() {
        postCoordinator.start()
    }
}
