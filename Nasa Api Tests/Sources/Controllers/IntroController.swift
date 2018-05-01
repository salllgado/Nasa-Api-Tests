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
        
        // Adiciona um titulo ao navigation bar
        title = CSUtils.getLocalizableString("WELLCOME")
        
        loginTf.placeholder = CSUtils.getLocalizableString("EMAIL_PLACEHOLDER")
        passwordTf.placeholder = CSUtils.getLocalizableString("PASSWORD_PLACEHOLDER")
        
        signInBtn.setTitle(CSUtils.getLocalizableString("SIGNIN_BUTTON_TITLE"), for: .normal)
        signUpBtn.setTitle(CSUtils.getLocalizableString("SIGNUP_BUTTON_TITLE"), for: .normal)
    }
    
    private func validLogin()-> Bool {
        if !verifyFields() {
            let alert = CSUtils.showAlertController("ERROR", mensage: "LOGIN_ERROR_BLANK_FIELDS", alertButtons: [.DISMISS]) { (_) -> Void? in
                return }
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
        //verificar se existe no CoreData os dados
        return true
    }
    
    //MARK: Actions
    
    @IBAction func actionSignIn(_ sender: Any) {
        if validLogin() {
            //chamar menu
            //salvar no userdefaults    
        }
    }
    
    @IBAction func actionSignUp(_ sender: Any) {
        // criar uma tela de signup
    }
        
}
