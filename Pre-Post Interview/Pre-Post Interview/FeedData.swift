//
//  FeedData.swift
//  TimeManagementApp
//
//  Created by Jide Opeola on 2/11/15.
//  Copyright (c) 2015 Jide Opeola. All rights reserved.
//

import UIKit

let _mainData: FeedData = FeedData()

class FeedData: NSObject {
    
    var companies: [String] = []
    
    var companyTitle = ""

    class func mainData() -> FeedData {
        
        return _mainData
        
    }
}
