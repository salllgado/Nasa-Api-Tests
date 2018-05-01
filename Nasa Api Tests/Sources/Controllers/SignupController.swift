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
        
        // define os estilos ao carregar a view
        configureStyles()
    }
    
    private func saveData() {
        
    }
    
    
    // MARK: Actions
    @IBAction func actionConfirm(_ sender: Any) {
        CSUtils.showAlertController("DADOS_CADASTRADOS", mensage: "DADOS_CADASTRADOS_MENSAGEM", alertButtons: [.OK], completion: in return)
    }
    
}

extension SignupController {
    
    fileprivate func configureStyles() {
        userNameTf.placeholder = CSUtils.getLocalizableString("NOME_PLACEHOLDER")
        userLoginTf.placeholder = CSUtils.getLocalizableString("EMAIL_PLACEHOLDER")
        userPasswordTf.placeholder = CSUtils.getLocalizableString("PASSWORD_PLACEHOLDER")
    }
}
