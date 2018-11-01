//
//  LinkDetailController.swift
//  Nasa Api Tests
//
//  Created by Chrystian on 31/10/18.
//  Copyright © 2018 Chrystian Salgado. All rights reserved.
//

import UIKit

class LinkDetailController: UIViewController {
    
    var nasaFeedObj: NasaFeedModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = nasaFeedObj.Name
        
        NetworkManager().requestApodURL(nasaFeedObj.Link) { (apodObj, error) in
            if let apodObj = apodObj {
                print(apodObj)
            }
            else if let err = error {
                print(err)
            }
        }
    }
}
