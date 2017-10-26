//
//  GamesViewController.swift
//  PlayStoreClone
//
//  Created by Ajay Singh on 19/6/17.
//  Copyright © 2017 Ajay Singh. All rights reserved.
//

import UIKit
import IGListKit
import SnapKit

class GamesViewController: UIViewController,ListAdapterDataSource {
    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()
     let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    let data: [Any] = [
        1,
        3,
        4,
        5,
        ]
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return data as! [ListDiffable]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if object is Int {
            return GamesHorizontalSectionController()
        } else {
            return LabelSectionController()
        }
    }
    
    @available(iOS 2.0, *)
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Games"
        view.addSubview(collectionView)
        adapter.collectionView = collectionView
        adapter.dataSource = self
        collectionView.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
