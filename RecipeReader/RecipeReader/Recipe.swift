//
//  Recipe.swift
//  RecipeReader
//
//  Created by jbaumann on 9/26/17.
//  Copyright © 2017 jbaumann. All rights reserved.
//

import Foundation

struct Recipe {
    let name: String
    let ingredients: [Ingredient]
    let steps: [String]
    let timers: [Int]
    let imageURL: URL
    let originalURL: URL
    
    init(name: String, ingredients: [Ingredient], steps: [String], timers: [Int], imageURL: URL, originalURL: URL) {
        self.name = name
        self.ingredients = ingredients
        self.steps = steps
        self.timers = timers
        self.imageURL = imageURL
        self.originalURL = originalURL
    }
    
    init(dictionary: [String: Any]) {
        let name = dictionary["name"] as! String
        let ingredientArray = dictionary["ingredients"] as! [[String: String]]
        let steps = dictionary["steps"] as! [String]
        let timers = dictionary["timers"] as! [Int]
        let imageURLString = dictionary["imageURL"] as! String
        let originalURLString = dictionary["originalURL"] as? String
        
        let imageURL = URL(string: imageURLString)!
        let originalURL = URL(string: originalURLString ?? "https://www.apple.com")
        
        let backupURL = URL(string: "https://www.apple.com")!
        
        let ingredients = ingredientArray.map { Ingredient(dictionary: $0) }
        
        self.init(name: name, ingredients: ingredients, steps: steps, timers: timers, imageURL: imageURL, originalURL: originalURL ?? backupURL)
    }
}
