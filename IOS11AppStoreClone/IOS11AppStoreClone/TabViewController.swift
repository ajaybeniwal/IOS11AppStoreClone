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
        let v3 = addChildVC(childVc: GamesViewController(), title: "Games", iconImage: "Games")
        let v1 = addChildVC(childVc: AppsViewController(), title: "Apps", iconImage: "App")
        let v2 = addChildVC(childVc: SearchViewController(), title: "Search", iconImage: "Search")
        self.viewControllers = [v3,v1,v2]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    private func addChildVC(childVc:UIViewController , title:String,iconImage:String)->UIViewController{
        childVc.tabBarItem = UITabBarItem.init(title: title, image: UIImage(named: iconImage), selectedImage: UIImage(named: iconImage))
        let navigationController = BaseNavController(rootViewController: childVc)
        return navigationController
        
    }

}
