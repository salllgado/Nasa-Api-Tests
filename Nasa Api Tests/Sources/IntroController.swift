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

protocol IntroControllable: class {
    
    func dismissErrorView()
    
    func showMainController()
}

class IntroController: UIViewController, IntroControllable {
    
    @IBOutlet weak var loginTf: UITextField!
    @IBOutlet weak var passwordTf: UITextField!
    
    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var signUpBtn: UIButton!
    
    var interactor: IntroInteractionable?
    
    let keychainAcess = KeychainSwift()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        self.view.alpha = 0.6
        interactor?.tryAutoLoginFromKeychain()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureStyles()
    }
    
    private func setup() {
        let viewController = self
        let interactor = IntroInteractor()
        let presenter = IntroPresenter()
        
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    func dismissErrorView() {
        self.view.alpha = 1
    }
    
    func showMainController() {
        let storyboard = UIStoryboard.init(name: "Menu", bundle: Bundle(for: self.classForCoder))
        if let navController = storyboard.instantiateInitialViewController() as? UINavigationController {
            self.present(navController, animated: true, completion: nil)
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
            if let navController = storyboard.instantiateInitialViewController() as? UINavigationController {
                self.present(navController, animated: true, completion: nil)
            }
        }
        else {
            let alertController = CSUtils.showAlertController(CSUtils.getLocalizableString("ERROR"), mensage: CSUtils.getLocalizableString(loginHandler.error!.rawValue), alertButtons: [.DISMISS]) { (_) -> Void? in
                return
            }
            self.present(alertController, animated: true, completion: nil)
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
