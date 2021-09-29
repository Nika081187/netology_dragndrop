//
//  ProfilePhotoCoordinator.swift
//  Navigation
//
//  Created by v.milchakova on 13.02.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
final class ProfilePhotoStackViewCoordinator: Coordinator {

    private weak var navigationController: UINavigationController?
    private var photosCoordinator: PhotosCoordinator
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
        photosCoordinator = PhotosCoordinator(navigationController: navigationController)
    }
    
    func start() {
        
    }
}

@available(iOS 13.0, *)
extension ProfilePhotoStackViewCoordinator: ProfilePhotoStackViewDelegate {
    func onArrowPressed() {
        photosCoordinator.start()
    }
}
