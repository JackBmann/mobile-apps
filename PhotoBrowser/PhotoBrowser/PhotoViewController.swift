//
//  PhotoViewController.swift
//  PhotoBrowser
//
//  Created by jbaumann on 10/12/17.
//  Copyright © 2017 jbaumann. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    
    var photo: Photo?
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        ImageService.shared.imageForURL(url: photo?.imageURL) { (image) in
            self.imageView.image = image
        }
    }
    
}

extension PhotoViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "photoCell", for: indexPath) as! PhotoCell
        cell.configure(photo?.title)
        return cell
    }
    
}