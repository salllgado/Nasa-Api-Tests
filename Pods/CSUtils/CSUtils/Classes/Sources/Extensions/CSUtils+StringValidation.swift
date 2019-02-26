//
//  CSUtils+StringValidation.swift
//  CSUtils
//
//  Created by Chrystian (Pessoal) on 26/01/2019.
//

import Foundation

public extension String {
    
    func isValidPassword(minChacters: Int) -> Bool {
        let minCharStringNum = String(minChacters)
        let regularExpression = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{\(minCharStringNum),}"
        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
        
        return passwordValidation.evaluate(with: self)
    }
    
    /*
     - Verifica se há conteudo em um determinado textfield, e retorna se há ou não
     - Parameter: UITextField
     - Return: Bool
     */
    func haveEmptyFields(_ fields: [UITextField]) -> Bool {
        var emptyField: Bool!
        for field in fields {
            if let text = field.text {
                if text.isEmpty || text == " " {
                    emptyField = true
                }
            }
        }
        return emptyField == true ? emptyField : false
    }
}
