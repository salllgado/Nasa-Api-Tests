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
    
    private func getData(selected api: AvailableApis, completionHandler: @escaping (Any?) -> Void) {
        NetworkManager().getDataFromApi(api: api) { (data, error) in
            
            if let _data = data {
                completionHandler(_data)
            } else {
                print(error)
            }
        }
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
        
        let cell = tableView.cellForRow(at: indexPath)
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.frame = CGRect(x: 0.0, y: 0.0, width: 40, height: 40)
        activityIndicator.color = .blue
        activityIndicator.center = cell!.center
        activityIndicator.hidesWhenStopped = true
        
        
        cell?.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
        getData(selected: selectedApi.apiType) { (data) in
            if let apodObj = data as? ApodObjModel {
                self.performSegue(withIdentifier: "loadLinkDetail", sender: apodObj)
            }
            else if let asteroidsList = data as? AsteroidsList {
                print(asteroidsList)
            }
            
            activityIndicator.stopAnimating()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "loadLinkDetail":
            guard let nasaFeedObj = sender as? ApodObjModel else { return }
            guard let linkDetailController = segue.destination as? LinkDetailController else { return }
            
            linkDetailController.nasaApodObj = nasaFeedObj
            return
        default:
            return
        }
    }
}
