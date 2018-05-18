//
//  TabViewController.swift
//  PlayStoreClone
//
//  Created by Ajay Singh on 13/6/17.
//  Copyright © 2017 Ajay Singh. All rights reserved.
//

import UIKit

class TabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let v1 = addChildVCNoNavigation(childVc: TodayViewController(), title: "Today", iconImage: "Today")
        let v2 = addChildVC(childVc: GamesViewController(), title: "Games", iconImage: "Games")
        let v3 = addChildVC(childVc: AppsViewController(), title: "Apps", iconImage: "App")
        let v4 = addChildVC(childVc: UpdateViewController(), title: "Updates", iconImage: "Update")
        let v5 = addChildVC(childVc: SearchViewController(), title: "Search", iconImage: "Search")
        self.viewControllers = [v1,v2,v3,v4,v5]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    private func addChildVCNoNavigation(childVc:UIViewController , title:String,iconImage:String)->UIViewController{
        childVc.tabBarItem = UITabBarItem.init(title: title, image: UIImage(named: iconImage), selectedImage: UIImage(named: iconImage))
        
        return childVc
        
    }

    private func addChildVC(childVc:UIViewController , title:String,iconImage:String)->UIViewController{
        childVc.tabBarItem = UITabBarItem.init(title: title, image: UIImage(named: iconImage), selectedImage: UIImage(named: iconImage))
        let navigationController = BaseNavController(rootViewController: childVc)
        return navigationController
        
    }

}
