//
//  ViewController.swift
//  ToDo
//
//  Created by Michael Babiy on 1/13/16.
//  Copyright © 2016 Michael Babiy. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: Helper Functions
    
    func configureCell(indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("todoCell", forIndexPath: indexPath)
        
        // Missing model.
        let toDoItem = Store.dataBase.allObjects()[indexPath.row]
        cell.textLabel?.text = toDoItem.errand
        
        return cell
    }
    
    // MARK: UITableViewDataSource

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        //changed the number of items
        return Store.dataBase.count()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        return self.configureCell(indexPath)
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete {
            
            // Missing model.
            let toDoItem = Store.dataBase.allObjects()[indexPath.row]
            Store.dataBase.remove(toDoItem)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        }
    }
    
}

