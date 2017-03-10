//
//  LoginViewController.swift
//  Lopp
//
//  Created by Lanka on 24/06/16.
//  Copyright © 2016 MTU. All rights reserved.
//

import Foundation

import UIKit
import Firebase

var mail:String = ""
var pass:String = ""

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    
    
    @IBAction func CreateAccount(sender: AnyObject) {
        FIRAuth.auth()?.createUserWithEmail(email.text!, password: password.text!, completion: {
            user, error in
            if error != nil{
                self.login()
                //Let the User know
            }
            else{
                print ("User Created")
                self.login()
            }
            
        })
        
    }
    func login(){
        FIRAuth.auth()?.signInWithEmail(email.text!, password: password.text!, completion: {
            user,error in
            if error != nil{print(error!.description);
                self.showAlert("Failed to Login", message:"Invalid Login or Password")
                return }
            else{
                print("User Logged in")
                self.performSegueWithIdentifier("Login", sender: nil)
            }
        })
        
        
    }
    
    func showAlert(title:String, message: String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion:nil)
        
    }

    
    
    
    
    @IBAction func loginDidTouch(sender: AnyObject) {
        //FIRAuth.auth()?.signInAnonymouslyWithCompletion({ user, error in
        //if error != nil { print(error!.description); return }
        //self.performSegueWithIdentifier("LoginToChat", sender: nil)
        //})
        FIRAuth.auth()?.signInWithEmail(email.text!, password: password.text!, completion:{ user, error in
            if error != nil { print(error!.description); return }
            self.performSegueWithIdentifier("Login", sender: nil)
        })
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)
        guard let navController = segue.destinationViewController as? UINavigationController,
            let chatController = navController.viewControllers.first as? ChatViewController else { return }
        
        chatController.senderId = FIRAuth.auth()?.currentUser?.uid
        chatController.senderDisplayName = FIRAuth.auth()?.currentUser?.displayName ?? ""
    }
    
}

