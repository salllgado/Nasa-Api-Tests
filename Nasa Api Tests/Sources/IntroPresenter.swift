//
//  IntroPresenter.swift
//  Nasa Api Tests
//
//  Created by Chrystian (Pessoal) on 09/12/2018.
//  Copyright © 2018 Chrystian Salgado. All rights reserved.
//

import Foundation
import LocalAuthentication

protocol IntroPresentable {
    
    var callbackUserAuthError: (()->Void?)! { get set }
    
    // Try auto login from SignedUser.
    func tryAutoLogin(signedUser: SignedUserable?)
}

class IntroPresenter: IntroPresentable {
    
    var callbackUserAuthError: (() -> Void?)!
    var viewController: IntroControllable?
    
    // Try auto login from SignedUser.
    func tryAutoLogin(signedUser: SignedUserable?) {
        if let user = signedUser {
            #if DEBUG
            print(user.userEmail)
            print(user.userPassword)
            #endif
            
            tryConfimation()
        }
        self.viewController?.dismissErrorView()
    }
    
    // Try some confimatio login using TouchID.
    func tryConfimation() {
        let authContext = LAContext()
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
            authContext.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Precisamos da sua digital para logar.") { (success, error) in
                if success {
                    self.viewController?.showMainController()
                }
                else {
                    print(error)
                    self.callbackUserAuthError()
                    self.viewController?.dismissErrorView()
                }
            }
        }
        else {
            self.viewController?.showMainController()
        }
    }
}
