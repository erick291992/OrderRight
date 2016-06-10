//
//  FirebaseDataService.swift
//  OrderRight
//
//  Created by Erick Manrique on 6/3/16.
//  Copyright © 2016 appsathome. All rights reserved.
//

import Foundation
import FirebaseAuth
import Firebase

class FirebaseDataService {
    
    private var _REF_DATABASE = FIRDatabase.database().reference()

    
    var REF_USERS: FIRDatabaseReference {
        return REF_DATABASE.child("users")
    }
    var REF_RESTAURANTS:FIRDatabaseReference{
        return REF_DATABASE.child("Restaurants")
    }
    var REF_RESTAURANTS_PERU:FIRDatabaseReference{
        return REF_RESTAURANTS.child("peruvian")
    }
    var REF_DATABASE:FIRDatabaseReference {
        return _REF_DATABASE
    }
    var REF_MENU:FIRDatabaseReference {
        return _REF_DATABASE.child("menu")
    }
    
    func createFireBaseUser(uid:String, user: AnyObject){
        REF_USERS.child(uid).setValue(user)
    }
//    func isUserLoggedin(onSuccess:()->Void){
//        FIRAuth.auth()?.addAuthStateDidChangeListener({ (Auth, user) in
//            if let user = user{
//                onSuccess()
//            }
//        })
//    }
    func getRestaurant(completionHandlerForRestaurants:(fetchedRestaurants:[Restaurant])->Void){
        REF_RESTAURANTS_PERU.observeEventType(FIRDataEventType.Value, withBlock: { (snapshot) in
            print("snanpshot")
            var fetchedRestaurants = [Restaurant]()
            let restaurants = snapshot.value as! [String : [String:AnyObject]]
            for (key,value) in restaurants{
                let res = Restaurant(restaurantKey: key,dictionary: value)
                fetchedRestaurants.append(res)
            }
            completionHandlerForRestaurants(fetchedRestaurants: fetchedRestaurants)
        })
    }
    
    func getMenuItems(restaurantKey:String, completionHandlerForMenu:(menuDictionary:[String:[MenuItem]])->Void) {
        var menuDictionary = [String:[MenuItem]]()
        REF_MENU.child(restaurantKey).child("menu1").observeEventType(FIRDataEventType.Value, withBlock: { (snapshot) in
            let menus = snapshot.value as! [String : [String:AnyObject]]
            for (key,value) in menus{
                //print(key)
                var menuItems = [MenuItem]()
                for (_,v) in value{
                    menuItems.append(MenuItem(dictionary: v as! [String : AnyObject]))
                }
                menuDictionary[key] = menuItems
            }
            //print(menuDictionary.count)
            completionHandlerForMenu(menuDictionary: menuDictionary)
        })
    }
    
    func donwloadImg(imageUrlPath:NSURL, completionHandlerForIMG:(NSData)->Void){
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: configuration)
        let request = NSURLRequest(URL: imageUrlPath)
        let dataTask = session.dataTaskWithRequest(request) { (data, response, error) in
            print("task down")
            guard error == nil else{
                print("error\(error?.localizedDescription)")
                return
            }
            guard let statusCode = (response as? NSHTTPURLResponse)?.statusCode where statusCode >= 200 && statusCode <= 299 else{
                print("Your request returned a status code other than 2xx!")
                return
            }
            guard let data = data else{
                return
            }
            completionHandlerForIMG(data)
        }
        dataTask.resume()
    }
    
    class func sharedInstance() -> FirebaseDataService {
        struct Singleton {
            static var sharedInstance = FirebaseDataService()
        }
        return Singleton.sharedInstance
    }
}