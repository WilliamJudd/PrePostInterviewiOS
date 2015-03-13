//
//  Company.swift
//  Pre-Post Interview
//
//  Created by William Judd on 3/7/15.
//  Copyright (c) 2015 William Judd. All rights reserved.
//

import UIKit


class Company: NSObject {
    
    var name: String!
    
    convenience init(companyInfo: [String:AnyObject]) {
        
        self.init()
        
        self.name = companyInfo["name"] as String
        
    }
    
    class func createCompany(name: String, completion: () -> ()) {
        
        // login
        //        println(email)
        let options: [String:AnyObject] = [
            
            "endpoint" : "company",
            "method" : "POST",
            "body" : [
                
                "authentication_token": User.currentUser().token!, "name": name
                
            ]
        
            
        ]
        
        APIRequest.requestWithOptions(options, andCompletion: { (responseInfo) -> () in
            
            //                println(responseInfo)
            
            println(responseInfo)
            let dataInfo = responseInfo["company"] as [String:AnyObject]
            
            let company = Company(companyInfo: dataInfo)
            
            completion()
            
            // do something here after the request is done
            
        })
        
    }
    
}

class Job: NSObject {
    
    
    
}
