//
//  IntroController.swift
//  Nasa Api Tests
//
//  Created by Chrystian Salgado on 02/03/2018.
//  Copyright © 2018 Chrystian Salgado. All rights reserved.
//

import UIKit
import CSUtils
import KeychainSwift

class IntroController: UIViewController {
    
    @IBOutlet weak var loginTf: UITextField!
    @IBOutlet weak var passwordTf: UITextField!
    
    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var signUpBtn: UIButton!
    
    let keychainAcess = KeychainSwift()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tryAutoLogin()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureStyles()
    }
    
    private func tryAutoLogin() {
        if let userLogin = keychainAcess.get("user_email"), let loginPassword = keychainAcess.get("user_password") {
            
            #if DEBUG
                print(userLogin)
                print(loginPassword)
            #endif
            
            let storyboard = UIStoryboard.init(name: "Menu", bundle: Bundle(for: self.classForCoder))
            if let introViewController = storyboard.instantiateViewController(withIdentifier: "instantiateMenuController") as? MenuController {
                self.navigationController?.pushViewController(introViewController, animated: true)
            }
        }
    }
    
    //MARK: Actions
    @IBAction func actionSignIn(_ sender: Any) {
        let  loginHandler = LoginValidationHelper().validLogin(loginTf: loginTf, passwordTf: passwordTf)
        
        if loginHandler.valid {
            // salvar os dados no keychain
            keychainAcess.set(self.loginTf.text!, forKey: "user_email")
            keychainAcess.set(self.passwordTf.text!, forKey: "user_password")
            
            let storyboard = UIStoryboard.init(name: "Menu", bundle: Bundle(for: self.classForCoder))
            if let introViewController = storyboard.instantiateViewController(withIdentifier: "instantiateMenuController") as? MenuController {
                self.navigationController?.pushViewController(introViewController, animated: true)
            }
        }
        else {
            print(loginHandler.error?.rawValue)
        }
    }
    
    @IBAction func actionSignUp(_ sender: Any) {
    }
}

extension IntroController {
    fileprivate func configureStyles() {
        
        // Adiciona um titulo ao navigation bar
        title = CSUtils.getLocalizableString("WELLCOME")
        
        loginTf.placeholder = CSUtils.getLocalizableString("EMAIL_PLACEHOLDER")
        passwordTf.placeholder = CSUtils.getLocalizableString("PASSWORD_PLACEHOLDER")
        
        signInBtn.setTitle(CSUtils.getLocalizableString("SIGNIN_BUTTON_TITLE"), for: .normal)
        signUpBtn.setTitle(CSUtils.getLocalizableString("SIGNUP_BUTTON_TITLE"), for: .normal)
    }
}
