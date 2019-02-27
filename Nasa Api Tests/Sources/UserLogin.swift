//
//  UserLogin.swift
//  Nasa Api Tests
//
//  Created by Chrystian Salgado on 26/02/19.
//  Copyright © 2019 Chrystian Salgado. All rights reserved.
//

import Foundation
import CoreData

class UserLogin: NSManagedObject {
    
    var userEmail: String?
    var userPassword: String?
    
    init(email: String?, password: String?) {
        self.userEmail = email
        self.userPassword = password
    }
}
