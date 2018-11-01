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
        
        retriveDataFromURL(nasaFeedObj.Link)
    }
    
    private func retriveDataFromURL(_ url: URL) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
//                let dataString = String(data: data, encoding: .utf8)
                do {
                    let jsonData = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                    print(jsonData)
                } catch {
                    print(error)
                }
            }
            else if let error = error {
                print(error)
            }
        }.resume()
    }
}
