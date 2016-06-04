//
//  LoginViewController.swift
//  OrderRight
//
//  Created by Erick Manrique on 5/19/16.
//  Copyright © 2016 appsathome. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import FirebaseAuth
import Firebase

class LoginViewController: UIViewController {
    var ref:FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.ref = FIRDatabase.database().reference()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func login(sender: AnyObject) {
//        let controller = storyboard!.instantiateViewControllerWithIdentifier("TabBarController") as! UITabBarController
//        presentViewController(controller, animated: true, completion: nil)
        startfacebookLogin()
    }

    func startfacebookLogin(){
        let facebookLogin = FBSDKLoginManager()
        facebookLogin.logInWithReadPermissions(["email"], fromViewController: self) { (facebookResult:FBSDKLoginManagerLoginResult!, facebookError:NSError!) in
            if facebookError != nil{
                print("facebook login failed\(facebookError)")
            }
            else{
                let accessToken = FBSDKAccessToken.currentAccessToken().tokenString
                print("successfully login in with facebook \(accessToken)")
                let credential = FIRFacebookAuthProvider.credentialWithAccessToken(accessToken)
                FIRAuth.auth()?.signInWithCredential(credential) { (user, error) in
                    if let user = user{
                        var userValue:[String:AnyObject] = [
                            "email": user.email ?? ""
                        ]
                        for profile in user.providerData {
                            userValue["provider"] = profile.providerID ?? ""
                            userValue["name"] = profile.displayName ?? ""
                            userValue["photoUrl"] = profile.photoURL?.absoluteString ?? ""
                        }
                        
//                        let key = self.ref.child("users").childByAutoId().key
//                        let childUpdates = ["/users/\(key)": userValue]
//                        self.ref.updateChildValues(childUpdates)
                        self.ref.child("users").child("\(user.uid)").setValue(userValue)
                        
                    }
                    
                }
            }
        }
    }
}

