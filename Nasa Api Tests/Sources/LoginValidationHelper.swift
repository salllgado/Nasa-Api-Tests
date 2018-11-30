//
//  LoginValidationHelper.swift
//  Nasa Api Tests
//
//  Created by Chrystian (Pessoal) on 18/11/2018.
//  Copyright © 2018 Chrystian Salgado. All rights reserved.
//

import Foundation
import CSUtils

class LoginValidationHelper {
    
    var loginTf: UITextField!
    var passwordTf: UITextField!
    
    /**
     - Percorre no core data por um login existente aonde email e senha coincidão com as informadas.
     - return: LoginHandler
     */
    func validLogin(loginTf: UITextField, passwordTf: UITextField) -> LoginHandler {
        self.loginTf = loginTf
        self.passwordTf = passwordTf
        
        return validLogin()
    }
    
    private func validLogin()-> LoginHandler {
        if verifyFields().valid {
            return validUser()
        }
        
        return verifyFields()
    }
    
    /**
     - Verifica se há campos em branco.
     - return: LoginHandler
     */
    private func verifyFields()-> LoginHandler {
        
        if (loginTf.text  == nil || loginTf.text == "") || (passwordTf.text == nil || passwordTf.text == "") {
            return LoginHandler(valid: false, error: ErrorType.loginIsBlank)
        }
        
        return LoginHandler(valid: true, error: nil)
    }
    
    /**
     - Percorre no core data por um login existente aonde email e senha coincidão com as informadas.
     - return: LoginHandler
     */
    private func validUser()-> LoginHandler {
        
        if let signedUsers = CoreDataManager().fetchUser(from: "User") {
            for user in signedUsers {
                if user.userEmail == self.loginTf.text && user.userPassword == self.passwordTf.text {
                    return LoginHandler(valid: true, error: nil)
                }
            }
        }
        return LoginHandler(valid: false, error: ErrorType.userNotFounded)
    }
}
