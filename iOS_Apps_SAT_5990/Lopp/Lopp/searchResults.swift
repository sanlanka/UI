//
//  searchResults.swift
//  Lopp
//
//  Created by Lanka on 25/06/16.
//  Copyright © 2016 MTU. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class searchResults : UIViewController, UITableViewDataSource
{
    
    let rootRef = FIRDatabase.database().referenceFromURL("https://lopp-2e6c8.firebaseio.com")
    var destinationsRef: FIRDatabaseReference!
    
    let people = [("Nelson","Downing Street")
                    ]
    let places = [("Nelson","Downing Street,Hancock")
                  ]

    private func observeDestinations() {
        let DestinationQuery = destinationsRef.queryLimitedToLast(25)
        
        DestinationQuery.observeEventType(.ChildAdded, withBlock: { snapshot in
            let id = snapshot.value!["senderId"] as! String
            let text = snapshot.value!["text"] as! String
            self.addDestination(id, text: text)
        })
    }
    
    func addDestination(id: String, text: String) {
    
        let key = rootRef.child("destinations").childByAutoId().key
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Lopp-results"
        // No avatars!
        destinationsRef = rootRef.child("destinations")
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
        return people.count
        }
        else{
            return places.count
        }
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if indexPath.section == 0{
        var (personName, personLocation) = people[indexPath.row]
        cell.textLabel?.text = personName
        }
        else
        {
            var (placetitle,add) = places[indexPath.row]
            cell.textLabel?.text = add

        }
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
           return "Loppers"
        }
        else{
            return "Address"
        }
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)
        guard let navController = segue.destinationViewController as? UINavigationController,
            let chatController = navController.viewControllers.first as? ChatViewController else { return }
        
        chatController.senderId = FIRAuth.auth()?.currentUser?.uid
        chatController.senderDisplayName = FIRAuth.auth()?.currentUser?.displayName ?? ""
    }
    
}