//
//  PhotoCell.swift
//  PhotoBrowser
//
//  Created by jbaumann on 10/12/17.
//  Copyright © 2017 jbaumann. All rights reserved.
//

import UIKit

class PhotoCell: UITableViewCell {
    
    @IBOutlet weak var photoInfoLabel: UILabel!
    
    func configure(_ with: String?) {
        photoInfoLabel.text = with
    }
    
}
