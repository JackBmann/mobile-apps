//
//  ViewController.swift
//  PageSwitcher
//
//  Created by jbaumann on 10/26/17.
//  Copyright © 2017 jbaumann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    var timeAmount: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.startAnimating()
        
        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true, block: { (timer) in self.timeAmount += 1.0
            if self.timeAmount > 100.0 {
                self.timeAmount = 0.0
            }
            self.progressView.setProgress(self.timeAmount/100.0, animated: true)
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

