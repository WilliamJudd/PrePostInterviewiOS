//
//  LoginViewController.swift
//  Pre-Post Interview
//
//  Created by William Judd on 3/7/15.
//  Copyright (c) 2015 William Judd. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
 
    @IBOutlet weak var buttonButtomConstraint: NSLayoutConstraint!
    

    
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        // Do any additional setup after loading the view.
        
        navigationController?.navigationBarHidden = true
        
        
        NSNotificationCenter.defaultCenter().addObserverForName(UIKeyboardWillShowNotification, object: nil, queue: NSOperationQueue.mainQueue()) { (notification) -> Void in
            
            if let kbSize = notification.userInfo?[UIKeyboardFrameEndUserInfoKey]?.CGRectValue().size {
                
                //    does not animate because of constraints you have to do self.view.layoutIfNeeded()
                self.buttonButtomConstraint.constant = 15 + kbSize.height
                
                self.view.layoutIfNeeded()
                // animates
                //           self.view.frame.origin.y = -kbSize.height
                
            }
            
        }
        
        
        NSNotificationCenter.defaultCenter().addObserverForName(UIKeyboardWillHideNotification, object: nil, queue: NSOperationQueue.mainQueue(), usingBlock: { (notification) -> Void in
            
            
            self.buttonButtomConstraint.constant = 15
            
            self.view.layoutIfNeeded()
            
            
        })
        
        
    }
    
    @IBAction func loginButton(sender: AnyObject) {
        
        let email = emailText.text;
        let userPassword = passwordText.text;
     //   User.currentUser().loginToken(emailText.text, password: passwordText.text) { () -> Void in
            
            self.dismissViewControllerAnimated(true, completion: nil)
            
        }
        
  //  }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
        
    }
//    
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
}
