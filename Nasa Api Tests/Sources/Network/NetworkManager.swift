//
//  NetworkManager.swift
//  Nasa Api Tests
//
//  Created by Chrystian on 01/11/18.
//  Copyright © 2018 Chrystian Salgado. All rights reserved.
//

import Foundation

class NetworkManager {
    
    func requestApodURL(_ url: URL, completionHandler: @escaping (ApodObjModel?, Error?) -> Void) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                do {
                    let result = try JSONDecoder().decode(ApodObjModel.self, from: data)
                    completionHandler(result, nil)
                } catch {
                    completionHandler(nil, error)
                }
            }
            else if let error = error {
                completionHandler(nil, error)
            }
        }.resume()
    }
}
