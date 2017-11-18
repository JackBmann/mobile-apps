//
//  ComposeMessageViewController.swift
//  SocialMediaReader
//
//  Created by jbaumann on 11/17/17.
//  Copyright © 2017 jbaumann. All rights reserved.
//

import UIKit
import SafariServices

class ComposeMessageViewController: UIViewController {
    
    @IBOutlet weak var compositionTextField: UITextField!
    @IBOutlet weak var replyToTextField: UITextField!
    @IBOutlet weak var imageURLTextField: UITextField!
    
    @IBAction func closeButtonClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func postButtonClicked(_ sender: Any) {
        print(compositionTextField.text!, imageURLTextField.text!, replyToTextField.text!)
        let message = NetworkingService.Message(user: NetworkingService.shared.user.name, text: compositionTextField.text!, date: Date(), imgURL: URL.init(string: imageURLTextField.text!), id: nil, replyTo: replyToTextField.text!, likedBy: [])
        NetworkingService().postMessage(message: message) { success in
            print(success)
        }
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
