//
//  RegisterViewController.swift
//  Pre-Post Interview
//
//  Created by William Judd on 3/7/15.
//  Copyright (c) 2015 William Judd. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var usernameText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    @IBOutlet weak var verifyPassword: UITextField!
    
    @IBOutlet weak var buttonButtomConstraint1: NSLayoutConstraint!
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    


    @IBAction func registerButton(sender: AnyObject) {
        
        
        let username = usernameText.text
        let userEmail = emailText.text
        let userPassword = passwordText.text
        let userVerifyPassword = verifyPassword.text
        
        
        
        User.currentUser().createUserToken(emailText.text, password: passwordText.text, verifyPassword: verifyPassword.text){ () -> Void in
            
            // push big button controller
            
            var businessButtonVC = self.storyboard?.instantiateViewControllerWithIdentifier("busbuttonVC") as BusinessButtonViewController
            
            self.navigationController?.pushViewController(businessButtonVC, animated: true)
            
            
            
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        navigationController?.navigationBarHidden = true
        
        NSNotificationCenter.defaultCenter().addObserverForName(UIKeyboardWillShowNotification, object: nil, queue: NSOperationQueue.mainQueue()) { (notification) -> Void in
            
            if let kbSize = notification.userInfo?[UIKeyboardFrameEndUserInfoKey]?.CGRectValue().size {
                
                //    does not animate because of constraints you have to do self.view.layoutIfNeeded()
                self.buttonButtomConstraint1.constant = 8 + kbSize.height
                
                self.topConstraint.constant -= 10
                
                self.view.layoutIfNeeded()
                // animates
                //           self.view.frame.origin.y = -kbSize.height
                
            }
            
        }
        
        
        NSNotificationCenter.defaultCenter().addObserverForName(UIKeyboardWillHideNotification, object: nil, queue: NSOperationQueue.mainQueue(), usingBlock: { (notification) -> Void in
            
            
            self.buttonButtomConstraint1.constant = 20
            
            self.topConstraint.constant += 10
            
            self.view.layoutIfNeeded()
            
            
        })

        
        
    }
    
}//END






    
    

