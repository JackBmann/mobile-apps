//
//  MessagesCell.swift
//  SocialMediaReader
//
//  Created by jbaumann on 11/16/17.
//  Copyright © 2017 jbaumann. All rights reserved.
//

import UIKit

class MessagesCell: UITableViewCell {
    
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    var message: NetworkingService.Message?
    
    func configure(_ with: NetworkingService.Message?) {
        userLabel.text = with?.user
        dateLabel.text = with?.date?.description
        messageLabel.text = with?.text
    }
    
}
