//
//  ViewController.swift
//  Student_Name_List
//
//  Created by Lanka on 21/06/16.
//  Copyright © 2016 MTU. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource {
    //var names = [String]()
    var people = [NSManagedObject]()
    @IBOutlet weak var TableView: UITableView!
    @IBAction func AddName(sender: AnyObject) {
        
        let alert = UIAlertController(title: "New Name", message: "Add New Name", preferredStyle: .Alert)
        let saveaction = UIAlertAction(title: "Save", style: .Default, handler: { (action:UIAlertAction)-> Void in
            let textfeild = alert.textFields!.first
           // self.names.append((textfeild?.text)!)
            self.saveName((textfeild?.text)!)
            
            self.TableView.reloadData()
        })
        
        alert.addTextFieldWithConfigurationHandler{(textfield: UITextField)-> Void in
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default){
            (action: UIAlertAction)-> Void in
        }
        alert.addAction(saveaction)
        alert.addAction(cancelAction)
        presentViewController(alert,animated: true, completion: nil)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let appleDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appleDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "Person")
            do{
            
                let result = try managedContext.executeFetchRequest(fetchRequest)
                people = result as! [NSManagedObject]
            
            } catch let error as NSError{
            
                print("Could not fetch\(error).\(error.userInfo)")
            }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        TableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        
        let person = people[indexPath.row]
        //cell!.textLabel!.text = names[indexPath.row]
        cell!.textLabel!.text = person.valueForKey("name") as? String
        return cell!
    }

    func saveName(name: String){
    
        let appleDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appleDelegate.managedObjectContext
        
        let entity = NSEntityDescription.entityForName("Person", inManagedObjectContext: managedContext)
        let person = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        person.setValue(name, forKey: "name")
        do{
            
            try managedContext.save()
            people.append(person)
        }catch let error as NSError{
                print ("could not save\(error).\(error.userInfo)")
            }
    }
    
}


