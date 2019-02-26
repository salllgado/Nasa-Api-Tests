//
//  CSLocalizations.swift
//  CSUtils
//
//  Created by Chrystian on 14/04/2018.
//

import Foundation
import UIKit

class CSLocalizations {
    
    /*
     - Seta uma localização definida por string
     - Parameter: String
     - Return: NSLocalizedString
     */
    func setLocalizableText(_ text: String) -> String {
        return NSLocalizedString(text, comment: "")
    }
}
