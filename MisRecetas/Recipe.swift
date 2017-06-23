//
//  Recipes.swift
//  MisRecetas
//
//  Created by Smart Geeks on 14/6/17.
//  Copyright © 2017 SmartGeeks. All rights reserved.
//

import Foundation
import UIKit

class Recipe : NSObject {
    
    var name : String!
    var image : UIImage!
    var time : Int!
    var ingredients : [String]!
    var steps : [String]!
    var isFavorite : Bool = false
    
    init(name : String, image : UIImage, time: Int, ingredients: [String], steps: [String], isFavorite: Bool) {
        
        self.name = name
        self.image = image
        self.time = time
        self.ingredients = ingredients
        self.steps = steps
        self.isFavorite = isFavorite
    }
}
