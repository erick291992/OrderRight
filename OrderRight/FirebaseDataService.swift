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
    func getRestaurant(completionHandlerForRestaurants:(FetchedRestaurants:[Restaurant])->Void){
        REF_RESTAURANTS_PERU.observeEventType(FIRDataEventType.Value, withBlock: { (snapshot) in
            print("snanpshot")
            var FetchedRestaurants = [Restaurant]()
            let restaurants = snapshot.value as! [String : [String:AnyObject]]
            for (_,value) in restaurants{
                print(value)
                let res = Restaurant(dictionary: value)
                FetchedRestaurants.append(res)
            }
            completionHandlerForRestaurants(FetchedRestaurants: FetchedRestaurants)
        })
    }
    
    class func sharedInstance() -> FirebaseDataService {
        struct Singleton {
            static var sharedInstance = FirebaseDataService()
        }
        return Singleton.sharedInstance
    }
}