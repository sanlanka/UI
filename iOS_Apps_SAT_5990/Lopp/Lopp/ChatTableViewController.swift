//
//  Chat.swift
//  Lopp
//
//  Created by Lanka on 24/06/16.
//  Copyright © 2016 MTU. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import CoreData

class ChatTableViewController: UITableViewController,UIViewController {
    
    let ref = Firebase(url:"https://lopp-2e6c8.firebaseio.com/")
    var messages = [String]()
    var uid:String = ""
   
    @IBAction func addmessage(sender:UIBarButtonItem){
        
        
    }
    
    override func tableView(tableView:UITableView, numberOfRowsInSection: Int)->Int {
        return messages.count
    }

    override func tableView(tableView:UITableView, cellForRowAtIndexPath indexPath: CNSIndexPath)->UITableViewCell {
        let cell = tableView.dequeReusableCellWithIdentifier("Cell") as! UITableViewCell
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.rightBarButtonItem = UIBarButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}