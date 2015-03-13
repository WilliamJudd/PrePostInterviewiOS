//
//  AddPositionVC.swift
//  Pre-Post Interview
//
//  Created by Jide Opeola on 3/8/15.
//  Copyright (c) 2015 William Judd. All rights reserved.
//

import UIKit

class AddPositionVC: UIViewController {

    @IBOutlet weak var addPositionLabel: UITextField!
    
    @IBOutlet weak var addPositionTableView: UITableView!
    
    @IBOutlet weak var interviewDatePicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let button = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "addCell")
        self.navigationItem.rightBarButtonItem = button
        
//        let cancel = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "addCells")
//        self.navigationItem.toolbar
    }
    
    func perform() {
        
        self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
//    #import "DismissSegue.h"
//    
//    @implementation DismissSegue
//    
//    - (void)perform
//    {
//    UIViewController *controller = self.sourceViewController;
//    [controller.parentViewController dismissViewControllerAnimated:YES
//    completion:nil];
//    }
//    
//    @end

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    var array:[String] = []
    
    
    func addCell() {
        
        println("im printing")
        
        let dateString = "\(interviewDatePicker.date)"
        let dateFormatter: NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy-- hh:mm"
        
        
        var testString = dateFormatter.stringFromDate(interviewDatePicker.date) + addPositionLabel.text
        
        
        println(testString)
        
 
        array.append(testString)
        
        //     var new1 = dateFormatter.stringFromDate(interviewDatePicker.date) as String
        
        
        
//        array.append((dateFormatter.stringFromDate(interviewDatePicker.date)+addPositionLabel.text))
        
    

        
        
//        
        addPositionTableView.reloadData()
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        
       
        
        
        
        return array.count
        
    }
    
    
    
//    - (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    // rows in section 0 should not be selectable
//    if ( indexPath.section == 0 ) return nil;
//    
//    // first 3 rows in any section should not be selectable
//    if ( indexPath.row <= 2 ) return nil;
//    
//    // By default, allow row to be selected
//    return indexPath;
//    }
    
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        
        if (indexPath.row <= 2) {
        
        return nil
        
        }
        
        return indexPath
        
    }
//
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("positionCell", forIndexPath: indexPath) as UITableViewCell
        // Configure the cell...
        
       // var projects = FeedData.mainData().week["projects"] as [[String:AnyObject]]
        
        
        
        var newProject = array[indexPath.row] as String
        
        
        
        cell.textLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 24)
        cell.textLabel?.textColor = UIColor(red: 0.58, green: 0.84, blue: 0.79, alpha: 1)
        
        cell.textLabel?.text = newProject
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        
        
        //  var cellHeight = SelectHoursTVC().cellHeight
        
        
        
        return 50 // screen height - top and bottom bars / number of rows
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
