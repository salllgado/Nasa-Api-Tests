//
//  LoginViewModel.swift
//  Nasa Api Tests
//
//  Created by Chrystian Salgado on 22/06/19.
//  Copyright © 2019 Chrystian Salgado. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

/// This class contatins all controlllers logic
class LoginViewModel {
    
    private let disposeBag = DisposeBag()
    private var user: User?
    
    let loading: PublishSubject<Bool> = PublishSubject()
    
    let emailViewModel = BehaviorRelay<String>(value: "")
    let passwordViewModel = BehaviorRelay<String>(value: "")
    
    func tryLogin() {
        self.loading.onNext(true)
        user = User(email: emailViewModel.value, password: passwordViewModel.value)
    }
}
