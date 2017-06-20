//
//  AppsViewController.swift
//  PlayStoreClone
//
//  Created by Ajay Singh on 13/6/17.
//  Copyright © 2017 Ajay Singh. All rights reserved.
//

import UIKit
import SnapKit


class AppsViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    var collectionView:UICollectionView = {let collectionView = UICollectionView(frame:CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        return collectionView;
        
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Apps"
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(collectionView)
        collectionView.register(NumberCell.self, forCellWithReuseIdentifier: "defaultCellId")
         /* Disable untill I found some solution for horizontal scrolling header bars*/
        /*collectionView.register(SectionHeaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "Header")*/
        collectionView.backgroundColor = UIColor.white
        collectionView.dataSource = self;
        let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout;
        flowLayout.scrollDirection = UICollectionViewScrollDirection.horizontal
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 4
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self;
        collectionView.snp.makeConstraints { (make) in
            make.leading.trailing.equalTo(self.view)
            make.top.equalTo(self.view).offset(0)
            make.height.equalTo(243)
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: "defaultCellId", for: indexPath) as! NumberCell
        cell.backgroundColor = UIColor.white
        cell.configure(number: indexPath.row)
        return cell;
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.size.width-30, height: 80)
    }
    
    /*
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionElementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath) as! SectionHeaderCell
            return headerView
        default:
            assert(false, "Unexpected element kind")
        }
    }*/
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailController = AppDetailViewController();
        self.navigationController?.pushViewController(detailController, animated: true)
    }
     /* Disable untill I found some solution for horizontal scrolling header bars*/
   /* func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.view.frame.size.width, height: 50)
    }*/
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


class SectionHeaderCell:UICollectionReusableView{
    var numberTypeLabel:UILabel = {
        var productTypeLabel = UILabel()
        productTypeLabel.font = UIFont.systemFont(ofSize: 20, weight: UIFontWeightBold)
        productTypeLabel.textColor = UIColor.black
        productTypeLabel.text = "Apps we love"
        productTypeLabel.numberOfLines = 0;
        return productTypeLabel
        
    }()
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
    }
    
    func setupSubViews(){
         self.addSubview(numberTypeLabel)
        numberTypeLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(self).offset(10)
            make.top.equalTo(self).offset(10)
            make.trailing.equalTo(self).offset(-10)
            
        }
    }
}

class NumberCell:UICollectionViewCell{
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
       // imageView.layer.borderWidth = 1
        return imageView
    }()
    
    
    var blankLabel:UILabel = {
        var productTypeLabel = UILabel()
        productTypeLabel.font = UIFont.systemFont(ofSize: 14)
        productTypeLabel.textColor = UIColor.lightGray
        productTypeLabel.backgroundColor = UIColor(red: 214/255, green: 214/255, blue: 214/255, alpha: 1)
        return productTypeLabel
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
        self.contentView.addSubview(blankLabel)
        imageView.snp.makeConstraints { (make) in
            make.leading.equalTo(self.contentView).offset(10)
            
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
            make.trailing.equalTo(self.contentView).offset(-10)
            make.centerY.equalTo(self.contentView)
            make.width.equalTo(70)
        }
        blankLabel.snp.makeConstraints { (make) in
            make.height.equalTo(1)
            make.leading.equalTo(imageView.snp.trailing).offset(10)
            make.trailing.equalTo(self.contentView).offset(-10)
            make.bottom.equalTo(self.contentView).offset(0)
        }
        
    }
    
    override func layoutSubviews() {
        
    }
    
    func configure(number:Int) ->Void{
        
    }
}
