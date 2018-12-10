//
//  IntroInteractor.swift
//  Nasa Api Tests
//
//  Created by Chrystian (Pessoal) on 09/12/2018.
//  Copyright © 2018 Chrystian Salgado. All rights reserved.
//

import Foundation
import KeychainSwift

protocol IntroInteractionable {
    
    /// Try get user from keychain
    func tryAutoLoginFromKeychain()
}

class IntroInteractor: IntroInteractionable {
    
    var presenter: IntroPresentable?
    
    let keychainAcess = KeychainSwift()
    
    /// Try get user from keychain/
    func tryAutoLoginFromKeychain() {
        var userSigned: SignedUserable?
        
        if let userLogin = keychainAcess.get("user_email"), let loginPassword = keychainAcess.get("user_password") {
            userSigned = SignedUser.init(userName: "", userEmail: userLogin, userPassword: loginPassword)
        }
        
        presenter?.tryAutoLogin(signedUser: userSigned)
        
        presenter?.callbackUserAuthError = {
            self.deleteUserFromKeychain()
        }
    }
    
    /// Delete all data from keychain.
    func deleteUserFromKeychain() {
        self.keychainAcess.clear()
    }
}
