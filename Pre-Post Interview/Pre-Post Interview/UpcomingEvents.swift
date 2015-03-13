//
//  UpcomingEvents.swift
//  Pre-Post Interview
//
//  Created by Jide Opeola on 3/7/15.
//  Copyright (c) 2015 William Judd. All rights reserved.
//

import UIKit

let SCREEN_WIDTH = UIScreen.mainScreen().bounds.width
let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.height

class UpcomingEvents: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        
     // println(User.currentUser().token)
        
        if User.currentUser().token == nil {
            
            var loginNC = storyboard?.instantiateViewControllerWithIdentifier("loginNC") as UINavigationController
            
            presentViewController(loginNC, animated: false, completion: nil)
            
            
            
            
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 2
    }

    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return array.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        
        
//        pomoRoundValue1.font = UIFont(name: "HelveticaNeue-Thin", size: 30)
//        pomoRoundValue1.textColor = UIColor(red: 0.00, green: 0.57, blue: 0.95, alpha: 1)
        
        return "hey"
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        var myLabel: UILabel!
       
        myLabel = UILabel(frame: CGRectMake((SCREEN_WIDTH / 2) - 90, 8, 180, 30))
        myLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 26)
        myLabel.textColor = UIColor(red: 0.58, green: 0.84, blue: 0.79, alpha: 1)
        myLabel.text = "March 17, 2015"
        
        
        var sectionView = UIView()
        
        sectionView.backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1)
        
        
    //    sectionView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
        
        sectionView.addSubview(myLabel)
        
        
        return sectionView
    }

  
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        
        
        
        return 50
    }
    
    var array = ["Home Depot","Coke","SRI", "Apple"]
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("upcomingCell", forIndexPath: indexPath) as UITableViewCell
        
        var newProject = array[indexPath.row]
        
        cell.textLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 24)
        cell.textLabel?.textColor = UIColor(red: 0.58, green: 0.84, blue: 0.79, alpha: 1)
     //  cell.textLabel?.textColor = UIColor.blackColor()
        
        cell.textLabel?.text = newProject

        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
