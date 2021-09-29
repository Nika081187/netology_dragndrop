//
//  ProfileCoordinator.swift
//  Navigation
//
//  Created by v.milchakova on 13.02.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
final class ProfileCoordinator: Coordinator {

    private weak var navigationController: UINavigationController?
    private var photosCoordinator: PhotosCoordinator
    
    init(navigationController: UINavigationController?){
        self.navigationController = navigationController
        photosCoordinator = PhotosCoordinator(navigationController: navigationController)
    }
    
    func start() {
        let vc = ProfileViewController()
        vc.photos.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

@available(iOS 13.0, *)
extension ProfileCoordinator: ProfileViewDelegate {
    func onArrowPressed() {
        photosCoordinator.start()
    }
}
