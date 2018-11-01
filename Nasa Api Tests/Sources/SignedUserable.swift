//
//  SignedUserable.swift
//  Nasa Api Tests
//
//  Created by Chrystian on 24/10/18.
//  Copyright © 2018 Chrystian Salgado. All rights reserved.
//

import Foundation

public protocol SignedUserable {
    var userName: String { get set }
    var userEmail: String { get set }
    var userPassword: String { get set }
}
