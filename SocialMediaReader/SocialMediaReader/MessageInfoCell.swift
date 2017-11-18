//
//  MessageInfoCell.swift
//  SocialMediaReader
//
//  Created by jbaumann on 11/16/17.
//  Copyright © 2017 jbaumann. All rights reserved.
//

import UIKit
import SafariServices

class MessageInfoCell: UITableViewCell {
    
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var messageTextLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var replyToLabel: UILabel!
    @IBOutlet weak var likedByLabel: UILabel!
    @IBOutlet weak var imgURLButton: UIButton!
    
    @IBAction func imgURLButtonClicked(_ sender: Any) {
        let safariVC = SFSafariViewController(url: imgURL)
        parentViewController.present(safariVC, animated: true, completion: nil)
    }
    
    var imgURL: URL!
    var parentViewController: UIViewController!
    var message: NetworkingService.Message
    
    func configure(user: String?, message: String?, date: Date?, id: String?, replyTo: String?, likedBy: [String]?, imageURL: URL?, parentViewController: UIViewController) {
        userLabel.text = "User: \(user!)"
        messageTextLabel.text = message
        dateLabel.text = date?.description
        idLabel.text = id
        replyToLabel.text = replyTo
        if likedBy?.count != nil {
            likedByLabel.text = "Liked By \(likedBy!.count) users: " + likedBy!.joined(separator: " ")
        }
        self.imgURL = imageURL
        imgURLButton.setTitle(imageURL?.absoluteString, for: UIControlState.normal)
        self.parentViewController = parentViewController
    }
    
}
