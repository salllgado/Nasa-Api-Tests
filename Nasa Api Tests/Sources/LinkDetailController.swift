//
//  LinkDetailController.swift
//  Nasa Api Tests
//
//  Created by Chrystian on 31/10/18.
//  Copyright © 2018 Chrystian Salgado. All rights reserved.
//

import UIKit

class LinkDetailController: UIViewController {
    
    var nasaApodObj: ApodObjModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layoutIfNeeded()
        
        
    }
    
    
    @IBAction func actionBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
