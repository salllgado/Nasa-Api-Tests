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
}

class LinkListController: UITableViewController {

    let apiAvailable: [NasaFeedModel] = [
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
        let cell = tableView.cellForRow(at: indexPath)
        
        self.performSegue(withIdentifier: "loadLinkDetail", sender: selectedApi)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "loadLinkDetail":
            guard let selectedApi = sender as? NasaFeedModel else { return }
            guard let linkDetailController = segue.destination as? LinkDetailController else { return }
            
            linkDetailController.selectedApi = selectedApi
            return
        default:
            return
        }
    }
}
