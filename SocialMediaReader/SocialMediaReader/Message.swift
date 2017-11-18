//
//  Message.swift
//  SocialMediaReader
//
//  Created by jbaumann on 11/16/17.
//  Copyright © 2017 jbaumann. All rights reserved.
//

import Foundation

struct Message: Codable {
    var user: String?
    var text: String?
    var date: Date?
    var imgURL: URL?
    var id: String?
    var replyTo: String?
    var likedBy: [String]?
}
