//
//  NetworkManager.swift
//  Nasa Api Tests
//
//  Created by Chrystian on 01/11/18.
//  Copyright © 2018 Chrystian Salgado. All rights reserved.
//

import Foundation

class NetworkManager {
    func getDataFromApi(api: AvailableApis, completionHandler: @escaping (Any?, Error?) -> Void) {
        switch api {
        case .apod:
            requestApodURL(completionHandler: completionHandler)
            break
        case .asteroids:
            requestAsteroidsListURL(completionHandler: completionHandler)
            break
        }
    }
}

extension NetworkManager {
    
    func requestAsteroidsListURL(completionHandler: @escaping (AsteroidsList?, Error?) -> Void) {
        let url = URL(string: "https://api.nasa.gov/neo/rest/v1/feed?start_date=2015-09-07&end_date=2015-09-08&api_key=DEMO_KEY")!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                do {
                    let responseData = try JSONDecoder().decode(AsteroidsList.self, from: data)
                    completionHandler(responseData, nil)
                } catch {
                    completionHandler(nil, error)
                }
            }
            else if let error = error {
                completionHandler(nil, error)
            }
        }.resume()
    }
    
    func requestApodURL(completionHandler: @escaping (ApodObjModel?, Error?) -> Void) {
        let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY&date=2014-10-01&concept_tags=True")!
        
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
