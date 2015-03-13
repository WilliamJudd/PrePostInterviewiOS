//
//  BusinessButtonViewController.swift
//  Pre-Post Interview
//
//  Created by William Judd on 3/7/15.
//  Copyright (c) 2015 William Judd. All rights reserved.
//

import UIKit

class BusinessButtonViewController: UIViewController {

    @IBAction func cancelButton(sender: AnyObject) {
   
  
        
//        self.navigationController?.popToRootViewControllerAnimated(true)

        self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
    
    
    }
    
    @IBAction func bigButton(sender: AnyObject) {
        
        
        
//        var listComp = storyboard?.instantiateViewControllerWithIdentifier("compNavi") as UINavigationController
//        
//        presentViewController(listComp, animated: false, completion: nil)
         self.dismissViewControllerAnimated(true, completion: nil)
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
