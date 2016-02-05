//
//  EntryListTableViewController.swift
//  Journal
//
//  Created by Kaleo Kim on 2/4/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class EntryListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return EntryController.sharedinstance.entries.count
        
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("entryCell", forIndexPath: indexPath)
        
        let entry = EntryController.sharedinstance.entries[indexPath.row]
        cell.textLabel?.text = entry.title
        
//       // let formatter = NSDateFormatter(coder: entry.timeStamp)
//        formatter!.dateStyle = .ShortStyle
//        formatter!.timeStyle = .ShortStyle
//        cell.detailTextLabel?.text = formatter
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            EntryController.sharedinstance.entries.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "viewEntrySegue" {
            let entryDetailViewController = segue.destinationViewController as! EntryDetailViewController
            
            if let cell = sender as? UITableViewCell,
                indexPath = tableView.indexPathForCell(cell) {
                    let entry = EntryController.sharedinstance.entries[indexPath.row]
                        entryDetailViewController.entry = entry
            }
        }
    }
}
