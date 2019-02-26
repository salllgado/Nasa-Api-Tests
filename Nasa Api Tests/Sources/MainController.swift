//
//  ViewController.swift
//  Nasa Api Tests
//
//  Created by Chrystian Salgado on 02/03/2018.
//  Copyright © 2018 Chrystian Salgado. All rights reserved.
//

import UIKit

class MainController: UIViewController {

    @IBOutlet weak var imageViewLogo: UIImageView!
    @IBOutlet weak var scrollViewContent: UIScrollView!
    
    @IBOutlet weak var loginTf: UITextField!
    @IBOutlet weak var passwordTf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func tryLogin() {
        let userLogin = UserLogin(email: loginTf.text, password: passwordTf.text)
    }

    @IBAction func actionScroll(_ sender: Any) {
        scrollViewContent.setContentOffset(CGPoint(x: self.view.frame.width, y: 0), animated: true)
    }
    
    @IBAction func actionLogin(_ sender: Any) {
        // ...
    }
}

