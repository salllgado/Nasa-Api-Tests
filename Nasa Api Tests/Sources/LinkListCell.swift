//
//  LinkListCell.swift
//  Nasa Api Tests
//
//  Created by Chrystian on 31/10/18.
//  Copyright © 2018 Chrystian Salgado. All rights reserved.
//

import UIKit
import CSUtils

class LinkListCell: UITableViewCell, NibBounded {

    @IBOutlet weak var lbTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(title: String) {
        self.lbTitle.text = title
    }
}
