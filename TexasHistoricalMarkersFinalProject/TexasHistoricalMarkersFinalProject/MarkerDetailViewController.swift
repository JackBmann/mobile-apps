//
//  MarkerDetailViewController.swift
//  TexasHistoricalMarkersFinalProject
//
//  Created by jbaumann on 12/14/17.
//  Copyright © 2017 jbaumann. All rights reserved.
//

import UIKit
import SafariServices

class MarkerDetailViewController: UIViewController {
    
    var marker: GMSMarker?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var directionsButton: UIButton!
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func directionsButtonClicked(_ sender: Any) {
        let lat = marker?.position.latitude.description
        let long = marker?.position.longitude.description
        let url = "comgooglemaps://?center=" + lat! + "," + long! + "&zoom=14"
        if (UIApplication.shared.canOpenURL(URL(string: url)!)) {
            UIApplication.shared.openURL(URL(string: url)!)
        } else {
            print("Can't use comgooglemaps:// (Install Google Maps)");
        }
    }
    
    func configure(marker: GMSMarker) {
        self.marker = marker
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        titleLabel.text = marker?.title
        //Check if there is an image included in the marker snippet, if so
//            url = ?
//            let task = URLSession(configuration: .ephemeral).dataTask(with: (url)!) { (data, response, error) in
//                guard data != nil else { return }
//                let image = UIImage(data: data!)
//                DispatchQueue.main.async {
//                    self.imageView.image = image
//                }
//            }
//            task.resume()
//        }
    }
    
}

extension MarkerDetailViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "markerDetailCell", for: indexPath) as! MarkerDetailCell
        cell.configure(marker: marker!)
        return cell
    }
    
}
