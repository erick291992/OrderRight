//
//  MenuItem.swift
//  OrderRight
//
//  Created by Erick Manrique on 6/7/16.
//  Copyright © 2016 appsathome. All rights reserved.
//

import Foundation

class MenuItem {
    
    struct Keys {
        static let name = "name"
        static let price = "price"
    }
    var name:String
    var price:Double
    
    init(dictionary: [String : AnyObject]){
        self.name = dictionary[Keys.name] as! String
        self.price = dictionary[Keys.price] as! Double
    }
}