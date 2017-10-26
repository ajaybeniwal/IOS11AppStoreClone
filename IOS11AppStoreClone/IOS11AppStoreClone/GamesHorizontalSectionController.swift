//
//  GamesHorizontalSectionController.swift
//  PlayStoreClone
//
//  Created by Ajay Singh on 20/6/17.
//  Copyright © 2017 Ajay Singh. All rights reserved.
//

import UIKit
import IGListKit

class GamesHorizontalSectionController: ListSectionController, ListAdapterDataSource {

    private var number: Int?
    override init() {
        super.init()
        self.inset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
    }
    
    lazy var adapter: ListAdapter = {
        let adapter = ListAdapter(updater: ListAdapterUpdater(),
                                  viewController: self.viewController)
        adapter.dataSource = self
        return adapter
    }()
    
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 300)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(of: EmbeddedCollectionViewCell.self,
                                                                for: self,
                                                                at: index) as? EmbeddedCollectionViewCell else {
                                                                    fatalError()
        }
        adapter.collectionView = cell.collectionView
        return cell
    }
    override func didUpdate(to object: Any) {
        number = object as? Int
    }
    
    // MARK: ListAdapterDataSource
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        guard let number = number else { return [] }
        return (0..<number).map { $0 as ListDiffable }
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return EmbeddedSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }

}


final class EmbeddedCollectionViewCell: UICollectionViewCell {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .clear
        view.alwaysBounceVertical = false
        view.alwaysBounceHorizontal = true
        self.contentView.addSubview(view)
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.frame
    }
    
}


final class EmbeddedSectionController: ListSectionController {
    
    private var number: Int?
    
    override init() {
        super.init()
        self.inset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        let height = collectionContext?.containerSize.height ?? 0
        return CGSize(width: (collectionContext?.containerSize.width)!-40, height: height)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(of: GameImageCell.self, for: self, at: index) as? GameImageCell else {
            fatalError()
        }
        
        
        return cell
    }
    
    override func didUpdate(to object: Any) {
        number = object as? Int
    }
    
}

final class GameImageCell: UICollectionViewCell {
    var numberTypeLabel:UILabel = {
        var productTypeLabel = UILabel()
        productTypeLabel.font = UIFont.systemFont(ofSize: 14)
        productTypeLabel.textColor = UIColor(red: 0/255, green: 149/255, blue: 255/255, alpha: 1)
        productTypeLabel.text = "NEW GAME"
        productTypeLabel.numberOfLines = 0;
        productTypeLabel.setContentHuggingPriority(UILayoutPriority.required, for:.vertical)
        return productTypeLabel
        
    }()
    
    
    
    var metaDataLabel:UILabel = {
        var productTypeLabel = UILabel()
        productTypeLabel.font = UIFont.systemFont(ofSize: 20)
        productTypeLabel.textColor = UIColor.black
         productTypeLabel.setContentHuggingPriority(UILayoutPriority.required, for:.vertical)
        productTypeLabel.text = "Injustice 2"
        return productTypeLabel
    }()
    
    var detailTextLabel:UILabel = {
        var productTypeLabel = UILabel()
        productTypeLabel.font = UIFont.systemFont(ofSize: 20)
        productTypeLabel.textColor = UIColor.lightGray
        productTypeLabel.text = "When iconic superheroes collide"
         productTypeLabel.setContentHuggingPriority(UILayoutPriority.required, for:.vertical)
        return productTypeLabel
    }()
    var imageView:UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "GamesIcon")
        imageView.layer.cornerRadius = 6
        imageView.layer.masksToBounds = true
        
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
        self.contentView.addSubview(detailTextLabel)
        
        
        
        numberTypeLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(self.contentView).offset(10)
            make.top.equalTo(self.contentView).offset(10)
            
        }
        metaDataLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(self.contentView).offset(10)
            make.top.equalTo(numberTypeLabel.snp.bottom).offset(5)
        }
        
        detailTextLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(self.contentView).offset(10)
            make.top.equalTo(metaDataLabel.snp.bottom).offset(5)
        }
        
         imageView.snp.makeConstraints { (make) in
         make.leading.equalTo(self.contentView).offset(10)
         make.trailing.equalTo(self.contentView).offset(-5)
         make.top.equalTo(detailTextLabel.snp.bottom).offset(5)
         make.bottom.equalTo(self.contentView).offset(-10)
            
         }
        
    }
}
