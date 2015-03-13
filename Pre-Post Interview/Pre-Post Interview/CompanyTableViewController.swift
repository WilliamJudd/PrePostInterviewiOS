//
//  CompanyTableViewController.swift
//  Pre-Post Interview
//
//  Created by William Judd on 3/7/15.
//  Copyright (c) 2015 William Judd. All rights reserved.
//

import UIKit

class CompanyTableViewController: UITableViewController {

    var companies: [Company] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        println("hey")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        let options: [String:AnyObject] = [
            
            "endpoint" : "company",
            "method" : "GET",
            "body" : [
                
                "authentication_token": User.currentUser().token!
                
            ]
            
            
        ]
        
        APIRequest.requestWithOptions(options, andCompletion: { (responseInfo) -> () in
            
            println(responseInfo)
            
            
            if let companiesInfo = responseInfo["companies"] as? [[String:AnyObject]] {
                
                println(responseInfo)
                
                for companyInfo in companiesInfo {
                    
                    let company = Company(companyInfo: companyInfo)
                    
                    self.companies.append(company)
                    
                    
                }
                
            }
            
            
            
            self.tableView.reloadData()
            
            // do something here after the request is done
            
        })
        
    }
    



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Potentially incomplete method implementation.
//        // Return the number of sections.
//        return 0
//    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
//        return companies.count
        
        return FeedData.mainData().companies.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("compCells", forIndexPath: indexPath) as UITableViewCell

       // let company = companies[indexPath.row]
        
        let company = FeedData.mainData().companies[indexPath.row]
        
//        cell.textLabel?.text = company.name
        
        cell.textLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 24)
        cell.textLabel?.textColor = UIColor(red: 0.58, green: 0.84, blue: 0.79, alpha: 1)
        
        cell.textLabel?.text = company
        
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
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
//        var businessButtonVC = self.storyboard?.instantiateViewControllerWithIdentifier("compDetail") as BusinessButtonViewController
//        
//        self.navigationController?.pushViewController(businessButtonVC, animated: true)
    
//        let indexPath = tableView.indexPathForSelectedRow()
//        
//        let currentCell: UITableViewCell = tableView.cellForRowAtIndexPath(indexPath!)!
//        
//        println(currentCell.textLabel!.text)
        
        
//        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//        NSString *str = cell.textLabel.text;
        
    }

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
