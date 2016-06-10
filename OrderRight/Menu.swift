//
//  Menu.swift
//  OrderRight
//
//  Created by Erick Manrique on 6/7/16.
//  Copyright © 2016 appsathome. All rights reserved.
//

import Foundation

class Menu{
    
    struct Keys {
        static let Appentizers = "Appetizers"
        static let Desserts = "Desserts"
        static let Drinks = "Drinks"
        static let MainDish = "Main Dish"
    }
    var appetizers:AnyObject
    var desserts:AnyObject
    var drinks:AnyObject
    var mainDish:AnyObject

    init(dictionary: [String : AnyObject]){
        self.appetizers = dictionary[Keys.Appentizers]!
        self.desserts = dictionary[Keys.Desserts]!
        self.drinks = dictionary[Keys.Drinks]!
        self.mainDish = dictionary[Keys.MainDish]!
    }
    
}