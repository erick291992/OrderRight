//
//  Restaurant.swift
//  OrderRight
//
//  Created by Erick Manrique on 6/4/16.
//  Copyright © 2016 appsathome. All rights reserved.
//

import Foundation

class Restaurant {
    
    struct Keys {
        static let Name = "name"
        static let ImageUrl = "imageUrl"
    }
    
    var imageUrl:String
    var name:String
    
    init(dictionary: [String : AnyObject]){
        self.name = dictionary[Keys.Name] as! String
        self.imageUrl = dictionary[Keys.ImageUrl] as! String
    }
}