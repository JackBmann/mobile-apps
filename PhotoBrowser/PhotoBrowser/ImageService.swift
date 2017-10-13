//
//  ImageService.swift
//  PhotoBrowser
//
//  Created by jbaumann on 10/12/17.
//  Copyright © 2017 jbaumann. All rights reserved.
//

import UIKit

//This class is unedited from the version we did in class.
class ImageService {
    
    static var shared = ImageService()
    
    func imageForURL(url: URL?, completion: @escaping (UIImage?) -> ()) {
        guard let url = url else { completion(nil); return }
        let task = URLSession(configuration: .ephemeral).dataTask(with: url) { (data, response, error) in
            guard data != nil else { completion(nil); return}
            if error != nil { completion(nil); return }
            let image = UIImage(data: data!)
            DispatchQueue.main.async {
                completion(image)
            }
        }
        task.resume()
    }
    
}
