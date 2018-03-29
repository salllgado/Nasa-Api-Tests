//
//  IntroController.swift
//  Nasa Api Tests
//
//  Created by Chrystian Salgado on 02/03/2018.
//  Copyright © 2018 Chrystian Salgado. All rights reserved.
//

import UIKit

class IntroController: UIViewController {

    @IBOutlet weak var loginTf: UITextField!
    @IBOutlet weak var passwordTf: UITextField!
    
    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var signUpBtn: UIButton!
    
    fileprivate var utils = Utilites()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Adiciona um titulo ao navigation bar
        title = utils.setLocalizableText("WELLCOME")
        
        loginTf.placeholder = utils.setLocalizableText("EMAIL_PLACEHOLDER")
        passwordTf.placeholder = utils.setLocalizableText("PASSWORD_PLACEHOLDER")
        signInBtn.setTitle(utils.setLocalizableText("SIGNIN_BUTTON_TITLE"), for: .normal)
        signUpBtn.setTitle(utils.setLocalizableText("SIGNUP_BUTTON_TITLE"), for: .normal)
    }
    
    private func validLogin()-> Bool {
        if !verifyFields() {
            let alert = utils.buildAlert(title: "ERROR", mensage: "LOGIN_ERROR_BLANK_FIELDS", alertButtons: [.DISMISS]) { (_) -> Void? in return }
            present(alert, animated: true, completion: {
                self.passwordTf.text = ""
            })
        }
        
    }
    
    private func verifyFields()-> Bool {
        var isValid: Bool!
        if (loginTf  != nil) && (passwordTf != nil) {
            isValid = true
        }
        return isValid == true ? true : false
    }
    
    private func validateUser()-> Bool {
        //verificar se existe no CoreData os dados
    }
    
    //MARK: Actions
    
    @IBAction func actionSignIn(_ sender: Any) {
        if validLogin() {
            // chamar menu
            //salvar no userdefaults
        }
    }
    
    @IBAction func actionSignUp(_ sender: Any) {
        let alert = utils.buildAlert(title: "Titulo", mensage: "Mensagem", alertButtons: [.CANCEL, .OK]) { (_) -> Void? in
            print("Retornou aqui")
        }
        present(alert, animated: true, completion: nil)
    }
}
