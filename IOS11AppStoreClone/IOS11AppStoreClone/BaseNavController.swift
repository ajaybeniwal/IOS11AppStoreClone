//
//  BaseNavController.swift
//  PlayStoreClone
//
//  Created by Ajay Singh on 13/6/17.
//  Copyright © 2017 Ajay Singh. All rights reserved.
//

import UIKit



    class BaseNavController: UINavigationController {
        override func viewDidLoad() {
            super.viewDidLoad()
            self.navigationBar.isTranslucent = false
            self.navigationBar.prefersLargeTitles = true
        }
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
        
        

}
