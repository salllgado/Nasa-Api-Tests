//
//  UIViewController+StatusBarColor.swift
//  CSUtils
//
//  Created by Chrystian (Pessoal) on 26/01/2019.
//

import Foundation
import UIKit

extension UIViewController {
    
    // Case this method crashes copy and past in your view controller.
    func setStatusBarStyle(_ style: UIStatusBarStyle, backgroundColor: UIColor) {
        if let statusBar = UIApplication.shared.value(forKey: "statusBar") as? UIView {
            statusBar.backgroundColor = backgroundColor
            statusBar.setValue(style == .lightContent ? UIColor.white : .black, forKey: "foregroundColor")
        }
    }
}
