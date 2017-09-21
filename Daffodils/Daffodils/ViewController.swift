//
//  ViewController.swift
//  Daffodils
//
//  Created by jbaumann on 9/19/17.
//  Copyright © 2017 jbaumann. All rights reserved.
//

// https://github.com/rmirabelli/UofD-Fall2017/blob/master/daffodil_park.jpg?raw=true


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        imageView.image = daffodil_park
//        imageView.image = UIImage(named: "daffodil_park")
        loadAndSetImage()
    }
    
    func loadAndSetImage() {
        let url = URL(string: "https://github.com/rmirabelli/UofD-Fall2017/blob/master/daffodil_park.jpg?raw=true")
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: url!) { (data, response, error) in
            if error == nil && data != nil {
                let image = UIImage(data: data!)
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
            }
        }
        task.resume()
    }


}

