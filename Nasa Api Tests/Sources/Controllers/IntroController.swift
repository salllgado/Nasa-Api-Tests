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
        title = NSLocalizedString("WELLCOME", comment: "")
        
        loginTf.placeholder = NSLocalizedString("EMAIL_PLACEHOLDER", comment: "")
        passwordTf.placeholder = NSLocalizedString("PASSWORD_PLACEHOLDER", comment: "")
        signInBtn.setTitle(NSLocalizedString("SIGNIN_BUTTON_TITLE", comment: ""), for: .normal)
        signUpBtn.setTitle(NSLocalizedString("SIGNUP_BUTTON_TITLE", comment: ""), for: .normal)
    }
    
    @IBAction func actionSignIn(_ sender: Any) {
        let alert = utils.buildAlert(title: "Titulo", mensage: "Mensagem") { (_) -> Void? in
            print("Retornou aqui")
        }
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func actionSignUp(_ sender: Any) {
        utils.buildAlert(title: "Titulo", mensage: "Mensagem") { (_) -> Void? in
            print("Retornou aqui")
            
        }
    }
    
}
