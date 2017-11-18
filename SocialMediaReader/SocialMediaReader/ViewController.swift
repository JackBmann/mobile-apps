//
//  ViewController.swift
//  SocialMediaReader
//
//  Created by jbaumann on 11/9/17.
//  Copyright © 2017 jbaumann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkingService().login()
        NetworkingService().getUsers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

