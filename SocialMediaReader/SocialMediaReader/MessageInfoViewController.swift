//
//  MessageInfoViewController.swift
//  SocialMediaReader
//
//  Created by jbaumann on 11/16/17.
//  Copyright © 2017 jbaumann. All rights reserved.
//

import UIKit
import SafariServices

class MessageInfoViewController: UIViewController {
    
    var message: NetworkingService.Message?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var messageTextLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var replyToLabel: UILabel!
    @IBOutlet weak var likedByLabel: UILabel!
    @IBOutlet weak var imgURLButton: UIButton!
    
    @IBAction func likeButtonClicked(_ sender: Any) {
        NetworkingService.shared.likeMessage(likeId: ["likedMessageID": (message?.id)!]) { }
    }
    
    @IBAction func imgURLButtonClicked(_ sender: Any) {
        let safariVC = SFSafariViewController(url: message!.imgURL!)
        self.present(safariVC, animated: true, completion: nil)
    }
    
    func configure(message: NetworkingService.Message) {
        userLabel.text = "User: " + (message.user ?? "")
        messageTextLabel.text = message.text
        dateLabel.text = message.date?.description
        idLabel.text = message.id
        replyToLabel.text = message.replyTo
        if message.likedBy?.count != nil {
            likedByLabel.text = "Liked By \(message.likedBy!.count) users: " + message.likedBy!.joined(separator: " ")
        }
        imgURLButton.setTitle(message.imgURL?.absoluteString, for: UIControlState.normal)
        self.message = message
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure(message: self.message!)
        if message?.imgURL != nil {
            let task = URLSession(configuration: .ephemeral).dataTask(with: (message?.imgURL)!) { (data, response, error) in
                guard data != nil else { return }
                let image = UIImage(data: data!)
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
            }
            task.resume()
        }
    }
    
}
