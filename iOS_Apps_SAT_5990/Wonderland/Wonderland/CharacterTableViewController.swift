//
//  CharacterTableViewController.swift
//  Wonderland
//
//  Created by Lanka on 18/06/16.
//  Copyright © 2016 MTU. All rights reserved.
//

import Foundation
import UIKit

let nameKey = "name"
let imageKey = "image"
let descriptionKey = "description"


class CharacterTableViewController: UITableViewController {
    
    var tableData: [[String: String]] {
        if tableData_Lazy == nil {
            if let url = NSBundle.mainBundle().URLForResource( "Characters",  withExtension: "nsarray") { tableData_Lazy = NSArray(contentsOfURL: url) as? [[String: String]]
            }
            assert(tableData_Lazy != nil, "Characters.nsarray did not load")
        }
        return tableData_Lazy!
    }
    private var tableData_Lazy: [[String: String]]?
    
    override func tableView(tableView: UITableView,  numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    override func tableView(tableView: UITableView,
                            cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellID = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier( cellID,
                                                                forIndexPath: indexPath) as UITableViewCell
        let characterInfo = tableData[indexPath.row]
        cell.textLabel?.text = characterInfo[nameKey]
        return cell }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "Detail" {
            let detailsController = segue.destinationViewController
                as! CharacterDetailViewController
            if let selectedPath = tableView?.indexPathForSelectedRow {
                detailsController.characterInfo = tableData[selectedPath.row]
            } }
    }
    
}
