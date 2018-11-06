//
//  LinkListController.swift
//  Nasa Api Tests
//
//  Created by Chrystian on 31/10/18.
//  Copyright © 2018 Chrystian Salgado. All rights reserved.
//

import UIKit

enum AvailableApis: String {
    case apod = "APOD"
    case asteroids = "Asteroids Feed"
}

class LinkListController: UITableViewController {

    let apiAvailable: [NasaFeedModel] = [
        NasaFeedModel(Name: AvailableApis.asteroids.rawValue, apiType: AvailableApis.asteroids),
        NasaFeedModel(Name: AvailableApis.apod.rawValue, apiType: AvailableApis.apod)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 88
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return apiAvailable.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "linkCellIdentifier", for: indexPath) as! LinkListCell
        let link = apiAvailable[indexPath.row]
        
        cell.configure(title: link.Name)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedApi = apiAvailable[indexPath.row]
        
        NetworkManager().getDataFromApi(api: selectedApi.apiType) { (data, error) in
            if let apodObj = data as? ApodObjModel {
                self.performSegue(withIdentifier: "loadLinkDetail", sender: apodObj)
            }
            else if let asteroidsList = data as? AsteroidsList {
                print(asteroidsList)
            }
            else if let err = error {
                print(err)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loadLinkDetail", let nasaFeedObj = sender as? NasaFeedModel {
            if let linkDetailController = segue.destination as? LinkDetailController {
                linkDetailController.nasaFeedObj = nasaFeedObj
            }
        }
    }
}
