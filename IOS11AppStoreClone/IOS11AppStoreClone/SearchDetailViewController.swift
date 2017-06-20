//
//  SearchDetailViewController.swift
//  PlayStoreClone
//
//  Created by Ajay Singh on 16/6/17.
//  Copyright © 2017 Ajay Singh. All rights reserved.
//

import UIKit
import IGListKit
import SnapKit

class SearchDetailViewController: UIViewController,UISearchBarDelegate,UISearchControllerDelegate,UISearchResultsUpdating,ListAdapterDataSource {
    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()
    let data: [Any] = [
        1,
        "UberDriver",
        3,
        "Uber",
        4,
        "Uber Driver",
        5,
        "Uber Find",
        
    ]
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
         return data as! [ListDiffable]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if object is Int {
            return NumberSectionController()
        } else {
            return LabelSectionController()
        }
    }
    
    @available(iOS 2.0, *)
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
    @available(iOS 8.0, *)
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    let searchController:UISearchController = {
        let search = UISearchController(searchResultsController: nil)
        return search
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Item Detail"
        self.navigationItem.largeTitleDisplayMode = .never
        searchController.delegate = self;
        self.navigationItem.searchController = searchController
        view.addSubview(collectionView)
        adapter.collectionView = collectionView
        adapter.dataSource = self
        collectionView.backgroundColor = UIColor.white
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}

final class NumberSectionController: ListSectionController {
    
    private var object: Int?
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 80)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(of: SearchDetailHeaderCell.self, for: self, at: index) as? SearchDetailHeaderCell else {
            fatalError()
        }
        return cell
    }
    
    override func didUpdate(to object: Any) {
        self.object = object as? Int
    }
    
}


final class LabelSectionController: ListSectionController {
    private var object: String?
    override init() {
        super.init()
        
    }
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 210)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(of: SearchDetailImageCell.self, for: self, at: index) as? SearchDetailImageCell else {
            fatalError()
        }
        return cell
    }
    
    override func didUpdate(to object: Any) {
        self.object = String(describing: object)
    }
    
}
final class SearchDetailHeaderCell: UICollectionViewCell {
var numberTypeLabel:UILabel = {
    var productTypeLabel = UILabel()
    productTypeLabel.font = UIFont.systemFont(ofSize: 16)
    productTypeLabel.textColor = UIColor.black
    productTypeLabel.text = "Uber-Car,Taxi,Bike Booking App"
    productTypeLabel.numberOfLines = 0;
    return productTypeLabel
    
}()

var getAppButton:UIButton =  {
    var submitButton = UIButton()
    submitButton.setTitle("GET", for: UIControlState.normal)
    submitButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: UIFontWeightBold)
    submitButton.setTitleColor(UIColor(red: 0/255, green: 149/255, blue: 255/255, alpha: 1), for: UIControlState.normal)
    submitButton.layer.cornerRadius = 12
    submitButton.layer.masksToBounds = true
    submitButton.backgroundColor =  UIColor(red: 224/255, green: 230/255, blue: 236/255, alpha: 1)
    return submitButton
    
}()

var metaDataLabel:UILabel = {
    var productTypeLabel = UILabel()
    productTypeLabel.font = UIFont.systemFont(ofSize: 14)
    productTypeLabel.textColor = UIColor.lightGray
    productTypeLabel.text = "Lifestyle"
    return productTypeLabel
}()
var imageView:UIImageView = {
    var imageView = UIImageView()
    imageView.image = UIImage(named: "Uber")
    imageView.layer.cornerRadius = 6
    imageView.layer.masksToBounds = true
    imageView.layer.borderColor = UIColor(red: 214/255, green: 214/255, blue: 214/255, alpha: 1).cgColor
    return imageView
}()


    
required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
}

override init(frame: CGRect) {
    super.init(frame: frame)
    self.setupSubViews()
}

func setupSubViews(){
    self.contentView.addSubview(numberTypeLabel)
    self.contentView.addSubview(imageView)
    self.contentView.addSubview(metaDataLabel)
    self.contentView.addSubview(getAppButton)
    
    imageView.snp.makeConstraints { (make) in
        make.leading.equalTo(self.contentView).offset(15)
        
        make.top.equalTo(self.contentView).offset(10)
        make.bottom.equalTo(self.contentView).offset(-10)
        make.height.width.equalTo(60)
    }
    
    numberTypeLabel.snp.makeConstraints { (make) in
        make.leading.equalTo(imageView.snp.trailing).offset(10)
        make.top.equalTo(imageView)
        
    }
    metaDataLabel.snp.makeConstraints { (make) in
        make.leading.equalTo(imageView.snp.trailing).offset(10)
        make.top.equalTo(numberTypeLabel.snp.bottom).offset(5)
    }
    
    getAppButton.snp.makeConstraints { (make) in
        make.leading.equalTo(numberTypeLabel.snp.trailing).offset(10)
        make.trailing.equalTo(self.contentView).offset(-15)
        make.centerY.equalTo(self.contentView)
        make.width.equalTo(70)
    }
}
}

final class SearchDetailImageCell:UICollectionViewCell{
    var imageView:UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "UberAppStore")
        imageView.layer.cornerRadius = 6
        imageView.layer.masksToBounds = true
        imageView.layer.borderColor = UIColor(red: 214/255, green: 214/255, blue: 214/255, alpha: 1).cgColor
        // imageView.layer.borderWidth = 1
        return imageView
    }()
    var imageView1:UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "UberAppStore")
        imageView.layer.cornerRadius = 6
        imageView.layer.masksToBounds = true
        imageView.layer.borderColor = UIColor(red: 214/255, green: 214/255, blue: 214/255, alpha: 1).cgColor
        // imageView.layer.borderWidth = 1
        return imageView
    }()
    var imageView2:UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "UberAppStore")
        imageView.layer.cornerRadius = 6
        imageView.layer.masksToBounds = true
        imageView.layer.borderColor = UIColor(red: 214/255, green: 214/255, blue: 214/255, alpha: 1).cgColor
        // imageView.layer.borderWidth = 1
        return imageView
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupSubViews()
    }
    func setupSubViews(){
        self.contentView.addSubview(imageView)
        self.contentView.addSubview(imageView1)
        self.contentView.addSubview(imageView2)
        
    }
    
    override func layoutSubviews() {
        let bounds = contentView.bounds
        let boundswidth = (bounds.size.width-60)/3;
        imageView.frame = CGRect(x: 15, y: 10, width: boundswidth, height: 190)
        imageView1.frame = CGRect(x: 30+boundswidth, y: 10, width: boundswidth, height: 190)
        imageView2.frame = CGRect(x: 45+2*boundswidth, y: 10, width: boundswidth, height: 190)
        
    }
}




