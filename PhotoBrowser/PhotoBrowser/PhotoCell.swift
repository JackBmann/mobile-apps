//
//  PhotoCell.swift
//  PhotoBrowser
//
//  Created by jbaumann on 10/12/17.
//  Copyright © 2017 jbaumann. All rights reserved.
//

import UIKit
import SafariServices

class PhotoCell: UITableViewCell {
    
    @IBOutlet weak var photoTitleLabel: UILabel!
    @IBOutlet weak var photoOwnerLabel: UILabel!
    @IBOutlet weak var photoIDLabel: UILabel!
    @IBOutlet weak var photoURLButton: UIButton!
    
    var photoURL: URL!
    var parentViewController: UIViewController!
    
    @IBAction func photoURLButtonClicked(_ sender: Any) {
        let safariVC = SFSafariViewController(url: photoURL)
        parentViewController.present(safariVC, animated: true, completion: nil)
    }
    
    func configure(title: String?, owner: String?, id: String?, url: URL?, parentViewController: UIViewController) {
        photoTitleLabel.text = "Title: " + title!
        photoOwnerLabel.text = "Owner: " + owner!
        photoIDLabel.text = "ID: " + id!
        photoURL = url!
        photoURLButton.setTitle(photoURL.absoluteString, for: UIControlState.normal)
        self.parentViewController = parentViewController
    }
    
}
