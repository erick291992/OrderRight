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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if (FIRAuth.auth()?.currentUser) != nil {
            // User is signed in.
            self.nextViewController()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func login(sender: AnyObject) {
        //self.nextViewController()
    }
    @IBAction func facebookLogin(sender: AnyObject) {
        startfacebookLogin()
    }
    

    func startfacebookLogin(){        
        let facebookLogin = FBSDKLoginManager()
        facebookLogin.logInWithReadPermissions(["email"], fromViewController: self) { (facebookResult:FBSDKLoginManagerLoginResult!, facebookError:NSError!) in
            guard facebookError == nil else{
                print("facebook login failed\(facebookError)")
                return
            }
            guard let accessToken = FBSDKAccessToken.currentAccessToken() else{
                return
            }
            let credential = FIRFacebookAuthProvider.credentialWithAccessToken(accessToken.tokenString)
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
                    FirebaseDataService.sharedInstance().createFireBaseUser(user.uid, user: userValue)
                    self.nextViewController()
                }
                
            }
        }
    }
    
    func nextViewController(){
        let controller = storyboard!.instantiateViewControllerWithIdentifier("TabBarController") as! UITabBarController
        presentViewController(controller, animated: true, completion: nil)
    }
}

