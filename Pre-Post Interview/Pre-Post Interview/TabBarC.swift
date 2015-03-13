//
//  TabBarC.swift
//  Pre-Post Interview
//
//  Created by Jide Opeola on 3/7/15.
//  Copyright (c) 2015 William Judd. All rights reserved.
//

import UIKit

class TabBarC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var tab0 = tabBar.items?[0] as UITabBarItem
        tab0.selectedImage = UIImage(named: "hack_home_icon_selected")!.imageWithRenderingMode(.AlwaysOriginal)
        tab0.image = UIImage(named: "hack_home_icon_unselected")!.imageWithRenderingMode(.AlwaysOriginal)
        
        var tab1 = tabBar.items?[1] as UITabBarItem
        tab1.selectedImage = UIImage(named: "hack_projects_icon_selected")!.imageWithRenderingMode(.AlwaysOriginal)
        tab1.image = UIImage(named: "hack_projects_icon_unselected")!.imageWithRenderingMode(.AlwaysOriginal)
        
        var tab2 = tabBar.items?[2] as UITabBarItem
        tab2.selectedImage = UIImage(named: "hack_settings_icon_selected")!.imageWithRenderingMode(.AlwaysOriginal)
        tab2.image = UIImage(named: "hack_settings_icon_unselected")!.imageWithRenderingMode(.AlwaysOriginal)
        

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
