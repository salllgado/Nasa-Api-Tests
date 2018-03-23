//
//  Utilites.swift
//  Nasa Api Tests
//
//  Created by Chrystian Salgado on 14/03/2018.
//  Copyright © 2018 Chrystian Salgado. All rights reserved.
//

import Foundation
import UIKit

class Utilites {
    
    open func buildAlert(title: String?, mensage: String?, alertButtons: [AlertButtons], completion: @escaping (_ :Void?)->Void?)  -> UIAlertController{
        let alertBox = UIAlertController(title: title, message: mensage, preferredStyle: .alert)
        for itens in alertButtons {
            switch itens {
            case .OK:
                let action = UIAlertAction(title: setLocalizableText("OK"), style: .default) { (_) in
                    completion(nil)
                }
                alertBox.addAction(action)
            case .CANCEL:
                let action = UIAlertAction(title: setLocalizableText("CANCEL"), style: .default) { (_) in }
                alertBox.addAction(action)
            case .DISMISS:
                let action = UIAlertAction(title: setLocalizableText("DISMISS"), style: .default) { (_) in }
                alertBox.addAction(action)
            }
        }
        return alertBox
    }
    
    /*
     - Seta uma localização definida por string
     - Parameter: String
     - Return: NSLocalizedString
    */
    open func setLocalizableText(_ text: String) -> String {
        return NSLocalizedString(text, comment: "")
    }
    
    open func validateField(_ fields: [UITextField]) -> Bool {
        var validateState: Bool = true
        for field in fields {
            if let text = field.text {
                if text.isEmpty || text == " " {
                    validateState = false
                }
            }
        }
        return validateState == false ? validateState : true
    }
}

