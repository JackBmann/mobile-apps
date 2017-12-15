//
//  MarkerDetailCell.swift
//  TexasHistoricalMarkersFinalProject
//
//  Created by jbaumann on 12/14/17.
//  Copyright © 2017 jbaumann. All rights reserved.
//

import UIKit

class MarkerDetailCell: UITableViewCell {
    
    var marker: GMSMarker?
    
    @IBOutlet weak var snippetLabel: UILabel!
    
    func configure(marker: GMSMarker) {
        self.marker = marker
        
        snippetLabel.text = marker.snippet
    }
    
}
