//
//  SignupController.swift
//  Nasa Api Tests
//
//  Created by Chrystian on 26/04/2018.
//  Copyright © 2018 Chrystian Salgado. All rights reserved.
//

import Foundation
import CSUtils

class SignupController: UIViewController {

    
    @IBOutlet weak var userPasswordTf: UITextField!
    @IBOutlet weak var userLoginTf: UITextField!
    @IBOutlet weak var userNameTf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // define os estilos ao carregar a view
        configureStyles()
    }
    
    private func saveData() {
        
    }
    
    // MARK: Actions
    @IBAction func actionConfirm(_ sender: Any) {
        guard let userLogin = self.userLoginTf.text, let userPassword = self.userPasswordTf.text, let userName = self.userNameTf.text else {
            return
        }
        CoreDataHelper().saveData(in: "User", values: [
            "email": userLogin,
            "password": userPassword,
            "name": userName
            ])
        
        CSUtils.showAlertController("Dados cadastrados", mensage: "Dados cadastrados mensagem", alertButtons: [.OK]) { (_) -> Void? in
            // ...
            return
        }
        
    }
}

extension SignupController {
    fileprivate func configureStyles() {
        userNameTf.placeholder = CSUtils.getLocalizableString("NOME_PLACEHOLDER")
        userLoginTf.placeholder = CSUtils.getLocalizableString("EMAIL_PLACEHOLDER")
        userPasswordTf.placeholder = CSUtils.getLocalizableString("PASSWORD_PLACEHOLDER")
    }
}
