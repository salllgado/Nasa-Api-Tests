//
//  IntroController.swift
//  Nasa Api Tests
//
//  Created by Chrystian Salgado on 02/03/2018.
//  Copyright © 2018 Chrystian Salgado. All rights reserved.
//

import UIKit
import CSUtils

class IntroController: UIViewController {
    
    @IBOutlet weak var loginTf: UITextField!
    @IBOutlet weak var passwordTf: UITextField!
    
    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var signUpBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureStyles()
    }
    
    private func validLogin()-> Bool {
        if !verifyFields() {
            let alert = CSUtils.showAlertController("ERROR", mensage: "LOGIN_ERROR_BLANK_FIELDS", alertButtons: [.DISMISS]) { (_) -> Void? in
                return
            }
            present(alert, animated: true, completion: {
                self.passwordTf.text = ""
            })
            return false
        }
        
        if !validUser() {
            let alert = CSUtils.showAlertController("ERROR", mensage: "LOGIN_ERROR_BLANK_FIELDS", alertButtons: [.DISMISS]) { (_) -> Void? in return }
            present(alert, animated: true, completion: {
                self.passwordTf.text = ""
            })
            return false
        }
        
        // faz verificação no userdefauts
        return true
    }
    
    private func verifyFields()-> Bool {
        var isValid: Bool!
        if (loginTf.text  == nil || loginTf.text == "") || (passwordTf.text == nil || passwordTf.text == "") {
            isValid = false
        }
        return isValid == false ? false : true
    }
    
    private func validUser()-> Bool {
        if let responseData = CoreDataHelper().fetchData(from: "User") {
            for user in responseData {
                if let userEmail = user.value(forKey: "email") as? String, let userPassword = user.value(forKey: "password") as? String {
                    if userEmail == self.loginTf.text && userPassword == self.passwordTf.text {
                        return true
                    }
                }
            }
        }
        return false
    }
    
    //MARK: Actions
    @IBAction func actionSignIn(_ sender: Any) {
        if validLogin() {
            //chamar menu
            
            let storyboard = UIStoryboard.init(name: "Menu", bundle: Bundle(for: self.classForCoder))
            if let introViewController = storyboard.instantiateViewController(withIdentifier: "instantiateMenuController") as? MenuController {
                self.navigationController?.pushViewController(introViewController, animated: true)
            }
        }
    }
    
    @IBAction func actionSignUp(_ sender: Any) {
        // criar uma tela de signup
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
