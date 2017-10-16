//
//  ImageBrowserCell.swift
//  PhotoBrowser
//
//  Created by jbaumann on 10/12/17.
//  Copyright © 2017 jbaumann. All rights reserved.
//

import UIKit

class ImageBrowserCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var photo: Photo?
    
    //For caching and displaying, to prevent the cell from showing a different image while waiting for an image to load.
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
}
