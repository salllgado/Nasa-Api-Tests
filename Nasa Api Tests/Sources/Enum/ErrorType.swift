//
//  ErrorType.swift
//  Nasa Api Tests
//
//  Created by Chrystian (Pessoal) on 18/11/2018.
//  Copyright © 2018 Chrystian Salgado. All rights reserved.
//

import Foundation

enum ErrorType: String {
    case userNotFounded = "USER_NOT_FOUNDED"
    case userLoginWrong = "USER_LOGIN_WRONG"
    case loginIsBlank = "ERROR_BLANK_FIELDS"
    case parsingError = "ERROR_PARSING_DATA"
}
