//
//  Restaurant.swift
//  OrderRight
//
//  Created by Erick Manrique on 6/4/16.
//  Copyright © 2016 appsathome. All rights reserved.
//

import Foundation
import UIKit

class Restaurant {
    
    struct Keys {
        static let Name = "name"
        static let ImageUrl = "imageUrl"
        static let Menu = "menu"
    }
    var restaurantKey:String!
    var imageUrl:String
    var name:String
    var menus:[String: AnyObject]?
    
//    init(dictionary: [String : AnyObject]){
//        self.name = dictionary[Keys.Name] as! String
//        self.imageUrl = dictionary[Keys.ImageUrl] as! String
//    }
    
    init(restaurantKey:String, dictionary: [String : AnyObject]){
        self.name = dictionary[Keys.Name] as! String
        self.imageUrl = dictionary[Keys.ImageUrl] as! String
        self.menus = dictionary["menus"] as? [String:AnyObject]
        self.restaurantKey = restaurantKey
    }
    
}