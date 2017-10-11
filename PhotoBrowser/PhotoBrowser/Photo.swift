//
//  Photo.swift
//  PhotoBrowser
//
//  Created by jbaumann on 10/10/17.
//  Copyright © 2017 jbaumann. All rights reserved.
//

import Foundation

struct Photo {
    
    let id: String
    let owner: String
    let secret: String
    let server: String
    let farm: Int
    let title: String
    let isPublic: Int
    let imageURL: URL
    
    init(id: String, owner: String, secret: String, server: String, farm: Int, title: String, isPublic: Int, imageURL: URL) {
        self.id = id
        self.owner = owner
        self.secret = secret
        self.server = server
        self.farm = farm
        self.title = title
        self.isPublic = isPublic
        self.imageURL = imageURL
    }
    
    init(dictionary: [String: Any]) {
        //Sample dictionary to be stored: {"id":"33735075571","owner":"94209416@N06","secret":"1cc6fd03bf","server":"2857","farm":3,"title":"Daffodil Field","ispublic":1,"isfriend":0,"isfamily":0}
        let id = dictionary["id"] as! String
        let owner = dictionary["owner"] as! String
        let secret = dictionary["secret"] as! String
        let server = dictionary["server"] as! String
        let farm = dictionary["farm"] as! Int
        let title = dictionary["title"] as! String
        let isPublic = dictionary["isPublic"] as? Int ?? 0
        
        //Generate the URL for later use
        let imageURLString = "https://farm" + String(farm) + ".static.flickr.com/" + server + "/" + id + "_" + secret + ".jpg"
        let imageURL = URL(string: imageURLString)
        
        self.init(id: id, owner: owner, secret: secret, server: server, farm: farm, title: title, isPublic: isPublic, imageURL: imageURL!)
    }
}
