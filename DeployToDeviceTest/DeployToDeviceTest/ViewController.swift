//
//  ViewController.swift
//  DeployToDeviceTest
//
//  Created by jbaumann on 11/30/17.
//  Copyright © 2017 jbaumann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    var recognizer: UITapGestureRecognizer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTap))
        view.addGestureRecognizer(recognizer!)
    }

    @objc func handleTap() {
        textField.resignFirstResponder()
    }


}

