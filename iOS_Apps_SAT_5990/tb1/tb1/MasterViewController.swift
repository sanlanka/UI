//
//  MasterViewController.swift
//  tb1
//
//  Created by Lanka on 11/06/16.
//  Copyright © 2016 MTU. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var objects = [AnyObject]()

    var apartments:[Apartment] = [
        
        Apartment(unit: "Unit 1, No 101",location:"2001 School Road"),
        Apartment(unit: "Unit 2, No 102", location: "2001 School Road"),
        Apartment(unit: "Unit 3, No 103", location: "2001 School Road"),
        Apartment(unit: "Unit 4, No 104", location: "2001 School Road"),
        Apartment(unit: "Unit 5, No 105", location: "2001 School Road"),
        
        Apartment(unit: "Unit 1, No 101", location: "2001 School Road"),
        Apartment(unit: "Unit 2, No 102", location: "2001 School Road"),
        Apartment(unit: "Unit 3, No 103", location: "2001 School Road"),
        Apartment(unit: "Unit 4, No 104", location: "2001 School Road"),
        Apartment(unit: "Unit 5, No 105", location: "2001 School Road"),

        Apartment(unit: "Unit 1, No 101", location: "2001 School Road"),
        Apartment(unit: "Unit 2, No 102", location: "2001 School Road"),
        Apartment(unit: "Unit 3, No 103", location: "2001 School Road"),
        Apartment(unit: "Unit 4, No 104", location: "2001 School Road"),
        Apartment(unit: "Unit 5, No 105", location: "2001 School Road"),
        
        Apartment(unit: "Unit 1, No 101", location: "2001 School Road"),
        Apartment(unit: "Unit 2, No 102", location: "2001 School Road"),
        Apartment(unit: "Unit 3, No 103", location: "2001 School Road"),
        Apartment(unit: "Unit 4, No 104", location: "2001 School Road"),
        Apartment(unit: "Unit 5, No 105", location: "2001 School Road"),
        
        Apartment(unit: "Unit 1, No 101", location: "2001 School Road"),
        Apartment(unit: "Unit 2, No 102", location: "2001 School Road"),
        Apartment(unit: "Unit 3, No 103", location: "2001 School Road"),
        Apartment(unit: "Unit 4, No 104", location: "2001 School Road"),
        Apartment(unit: "Unit 5, No 105", location: "2001 School Road")



    ]
    
    var  tenants:[Person] = [
    Person(name: "John Doe", Student_ID: "1001023"),
    Person(name: "Doe John", Student_ID: "1001023"),
    Person(name: "John Ava", Student_ID: "1001023"),
    Person(name: "John Abigail", Student_ID: "1001023"),
    Person(name: "John Alexis", Student_ID: "1001023"),

    Person(name: "John Ana", Student_ID: "1001023"),
    Person(name: "Alyssa John", Student_ID: "1001023"),
    Person(name: "Amber John", Student_ID: "1001023"),
    Person(name: "Andrea John", Student_ID: "1001023"),
    Person(name: "Amelia John", Student_ID: "1001023"),
    
    Person(name: "Allison John Doe", Student_ID: "1001023"),
    Person(name: "Alexandra Doe John", Student_ID: "1001023"),
    Person(name: "Amy John", Student_ID: "1001023"),
    Person(name: "Audrey John", Student_ID: "1001023"),
    Person(name: "Alice John", Student_ID: "1001023"),
    
    Person(name: " Ariana John Doe", Student_ID: "1001023"),
    Person(name: " Grande Doe John", Student_ID: "1001023"),
    Person(name: "Alissa John", Student_ID: "1001023"),
    Person(name: "Ana John", Student_ID: "1001023"),
    Person(name: "Angela John", Student_ID: "1001023"),
    
    Person(name: "Alica John Doe", Student_ID: "1001023"),
    Person(name: "April Doe John", Student_ID: "1001023"),
    Person(name: "Anne John", Student_ID: "1001023"),
    Person(name: "Abby John", Student_ID: "1001023"),
    Person(name: "Alma selma John", Student_ID: "1001023"),
    
    ]
    
    func Processing_Apartment(notification:NSNotification)
    {
        if let TheApartment = notification.object as? Apartment{
            
        for (index,apartment) in apartments.enumerate(){
            if apartment === TheApartment{
                
                let path = NSIndexPath(forItem: index, inSection:0 )
                tableView.reloadRowsAtIndexPaths([path], withRowAnimation: .None)
            }
            
            
        }
        
    }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var i: Int
        for i in apartments.indices{
        
            apartments[i].tenant = tenants[i]
            
        }
        self.navigationItem.leftBarButtonItem = self.editButtonItem()

        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(insertNewObject(_:)))
        self.navigationItem.rightBarButtonItem = addButton
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        let center = NSNotificationCenter.defaultCenter()
        center.addObserver(self, selector:"Processing_Apartment:", name: notificationchanged, object: detailViewController?.detailItem)
    }

    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func insertNewObject(sender: AnyObject) {
        var new_apartment = Apartment(unit: "unit", location: "address")
        var new_tenant = Person(name: "Name",Student_ID:"ID Number")
        new_apartment.tenant = new_tenant
        apartments.insert(new_apartment, atIndex: 0)
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let apartment = apartments[indexPath.row] as! Apartment
                
                
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = apartment
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apartments.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        let apartment = apartments[indexPath.row] as! Apartment
        cell.textLabel!.text = apartment.unit
        cell.detailTextLabel!.text = apartment.location
        cell.imageView?.image = apartment.viewimage
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            apartments.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }


}

