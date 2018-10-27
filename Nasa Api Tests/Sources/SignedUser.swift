//
//  SignedUser.swift
//  Nasa Api Tests
//
//  Created by Chrystian on 24/10/18.
//  Copyright © 2018 Chrystian Salgado. All rights reserved.
//

import Foundation

struct SignedUser: SignedUserable {
    var userName: String
    var userEmail: String
    var userPassword: String
}
