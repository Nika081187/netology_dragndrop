//
//  InfoCoordinator.swift
//  Navigation
//
//  Created by v.milchakova on 13.02.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
final class InfoCoordinator: Coordinator {

    private weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = InfoViewController()
        vc.modalPresentationStyle = .popover
        vc.navigationController?.isToolbarHidden = true
        navigationController?.present(vc, animated: true, completion: nil)
    }
}
