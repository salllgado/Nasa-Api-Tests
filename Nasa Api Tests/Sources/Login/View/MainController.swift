//
//  ViewController.swift
//  Nasa Api Tests
//
//  Created by Chrystian Salgado on 02/03/2018.
//  Copyright © 2018 Chrystian Salgado. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MainController: UIViewController {

    @IBOutlet weak var imageViewLogo: UIImageView!
    @IBOutlet weak var scrollViewContent: UIScrollView!
    
    @IBOutlet weak var loginTf: UITextField!
    @IBOutlet weak var passwordTf: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    let disposeBag = DisposeBag()
    var loginViewModel: LoginViewModel = LoginViewModel()
    
    var someText: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        bindingElements()
    }
    
    private func bindingElements() {
        loginViewModel.loading
            .bind(to: self.rx.isAnimating) // referencia o valor de loginViewModel para is animating.
            .disposed(by: disposeBag) // dealocw
        
        loginTf.rx.text.orEmpty
            .bind(to: loginViewModel.emailViewModel)
            .disposed(by: disposeBag)
        
        passwordTf.rx.text.orEmpty
            .bind(to: loginViewModel.passwordViewModel)
            .disposed(by: disposeBag)
    }
    
    func displayLoading(enable: Bool) {
        // ...
    }

    @IBAction func actionScroll(_ sender: Any) {
        scrollViewContent.setContentOffset(CGPoint(x: self.view.frame.width, y: 0), animated: true)
    }
    
    @IBAction func actionLogin(_ sender: Any) {
        loginViewModel.tryLogin()
    }
}

extension Reactive where Base: MainController {
    
    /// Bindable sink for `startAnimating()`, `stopAnimating()` methods.
    internal var isAnimating: Binder<Bool> {
        return Binder(self.base, binding: { (vc, active) in
            vc.displayLoading(enable: active)
        })
    }
}
