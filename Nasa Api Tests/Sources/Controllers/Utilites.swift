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
    
    open func buildAlert(title: String?, mensage: String?, completion: @escaping (_ :Void?)->Void?)  -> UIAlertController{
        let alertBox = UIAlertController(title: title, message: mensage, preferredStyle: .alert)
        let actionDismiss = UIAlertAction(title: "DISMISS", style: .default) { (_) in
            completion(nil)
        }
        
        alertBox.addAction(actionDismiss)
        return alertBox
    }
}

