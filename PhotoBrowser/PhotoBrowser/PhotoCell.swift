//
//  PhotoCell.swift
//  PhotoBrowser
//
//  Created by jbaumann on 10/12/17.
//  Copyright © 2017 jbaumann. All rights reserved.
//

import UIKit

class PhotoCell: UITableViewCell {
    
    @IBOutlet weak var photoTitleLabel: UILabel!
    @IBOutlet weak var photoOwnerLabel: UILabel!
    @IBOutlet weak var photoIDLabel: UILabel!
    @IBOutlet weak var photoURLLabel: UILabel!
    
    func configure(title: String?, owner: String?, id: String?, url: URL?) {
        photoTitleLabel.text = title
        photoOwnerLabel.text = owner
        photoIDLabel.text = id
        photoURLLabel.text = url?.absoluteString
    }
    
}
