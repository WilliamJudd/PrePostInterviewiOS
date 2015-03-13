//
//  CircleButtons.swift
//  TimeManagementApp
//
//  Created by Jide Opeola on 2/9/15.
//  Copyright (c) 2015 Jide Opeola. All rights reserved.
//

import UIKit

@IBDesignable class CircleButtons: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 1
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
        
    }


}
