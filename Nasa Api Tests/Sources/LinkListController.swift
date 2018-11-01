//
//  LinkListController.swift
//  Nasa Api Tests
//
//  Created by Chrystian on 31/10/18.
//  Copyright © 2018 Chrystian Salgado. All rights reserved.
//

import UIKit

class LinkListController: UITableViewController {
    

    let apiAvailable: [NasaFeedModel] = [
        NasaFeedModel(Name: "Asteroids Feed", Link: URL(string: "https://api.nasa.gov/neo/rest/v1/feed?start_date=2015-09-07&end_date=2015-09-08&api_key=DEMO_KEY")!),
        NasaFeedModel(Name: "APOD", Link: URL(string: "https://api.nasa.gov/planetary/apod")!)
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
        let link = apiAvailable[indexPath.row]
        performSegue(withIdentifier: "loadLinkDetail", sender: link)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loadLinkDetail", let nasaFeedObj = sender as? NasaFeedModel {
            if let linkDetailController = segue.destination as? LinkDetailController {
                linkDetailController.nasaFeedObj = nasaFeedObj
            }
        }
    }
}
