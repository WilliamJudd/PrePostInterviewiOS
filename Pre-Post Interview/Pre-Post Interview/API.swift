//
//  API.swift
//  Pre-Post Interview
//
//  Created by William Judd on 3/7/15.
//  Copyright (c) 2015 William Judd. All rights reserved.
//

import Foundation

//let API_URL = "http://brian.t.proxylocal.com/"

let API_URL = "https://pre-post-interview.herokuapp.com/"

typealias ResponseBlock = (responseInfo: [String:AnyObject]) -> ()

class APIRequest {
    
    // (responseInfo: [String:AnyObject]) -> ()
    
    class func requestWithEndpoint(endpoint: String, method: String, completion: ResponseBlock) {
        
        var options = [
            
            "endpoint" : endpoint,
            "method" : method,
            "body" : [
                
                "auth_token" : [User.currentUser().token!]]] as [String: AnyObject]
        
        requestWithOptions(options, andCompletion: completion)
        
        
        
    }
    
    class func requestWithOptions(options: [String: AnyObject], andCompletion completion: ResponseBlock) {
        
        
        var url = NSURL(string: API_URL + (options["endpoint"] as String))
        var request = NSMutableURLRequest(URL: url!)
        
        request.HTTPMethod = options["method"] as String
        
        ////BODY
        
        let bodyInfo = options["body"] as [String:AnyObject]
        
        let requestData = NSJSONSerialization.dataWithJSONObject(bodyInfo, options: NSJSONWritingOptions.allZeros, error: nil)
        let jsonString = NSString(data: requestData!, encoding: NSUTF8StringEncoding)
        let postLength = "\(jsonString!.length)"
        
        request.setValue(postLength, forHTTPHeaderField: "Content-Length")
        let postData = jsonString?.dataUsingEncoding(NSASCIIStringEncoding, allowLossyConversion: true)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.HTTPBody = postData
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response, data, error) -> Void in
            
            if error == nil {
                
                //do something with data
                
                if let json = NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers, error: nil) as? [String:AnyObject] {
                    
                    completion(responseInfo: json)
                    
                }
            }
        }
    }
}



private let _currentUser = User()

class User {
    
    
    
    var token: String? {
        
        didSet {
            
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setObject(token, forKey: "token")
            defaults.synchronize()
            
        }
        
        
    }
    
    init() {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        token = defaults.objectForKey("token") as? String
        
        //        println(token)
        
    }
    
    class func currentUser() -> User { return _currentUser }
    
    
    
    func createUserToken(email: String, password: String, verifyPassword: String, completion: () -> ()) {
        
        // sign up
        let options: [String:AnyObject] = [
            
            "endpoint" : "users",
            "method" : "POST",
            "body" : [
                
                "user" : [ "email" : email, "password" : password, "password_confirmation" : verifyPassword]
                
            ]
            
        ]
        APIRequest.requestWithOptions(options, andCompletion: { (responseInfo) -> () in
            
            //                println(responseInfo)
         
            
            let dataInfo = responseInfo["user"] as [String:AnyObject]
            self.token = dataInfo["authentication_token"] as? String
            
            completion()
            
            // do something here after the request is done
            
        })
        
    }
    
    func loginToken(email: String, password: String, completion: () -> ()) {
        
        // login
        //        println(email)
        let options: [String:AnyObject] = [
            
            "endpoint" : "users/sign_in",
            "method" : "POST",
            "body" : [
                
                "user" : [ "email" : email, "password" : password]
                
                
            ]
            
            
        ]
        
        APIRequest.requestWithOptions(options, andCompletion: { (responseInfo) -> () in
            
            //                println(responseInfo)
       
            
            let dataInfo = responseInfo["user"] as [String:AnyObject]
            self.token = dataInfo["authentication_token"] as? String
            
            completion()
            
            // do something here after the request is done
            
        })
        
        
        
    }
    
    func logoutUserToken() {
        
        // sign up
        let options: [String:AnyObject] = [
            
            "endpoint" : "users/sign_out",
            "method" : "DELETE",
            "body" : [
                
                "authentication_token": token!
                
            ]
        ]
        
        APIRequest.requestWithOptions(options, andCompletion: { (responseInfo) -> () in
            
            
            // do something here after the request is done
            
        })
        
        token = nil
        
        
    }
    
    
    
}//END
