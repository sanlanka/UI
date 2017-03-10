//
//  ViewController.swift
//  Lopp
//
//  Created by Lanka on 23/06/16.
//  Copyright © 2016 MTU. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

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
            if error != nil{
                print("Incorrect")
            }
            else{
                print("User Logged in")
            }

            
        })
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

