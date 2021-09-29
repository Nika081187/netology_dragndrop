//
//  LocalAuthorizationService.swift
//  Navigation
//
//  Created by v.milchakova on 19.09.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit
import LocalAuthentication

class LocalAuthorizationService {
    func authorizeIfPossible(_ authorizationFinished: @escaping (Bool) -> Void) {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Идентифицируйте себя!"

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in

                DispatchQueue.main.async {
                    if success {
                        authorizationFinished(true)
                    } else {
                        authorizationFinished(false)
                    }
                }
            }
        } else {
            authorizationFinished(false)
        }
    }
}
