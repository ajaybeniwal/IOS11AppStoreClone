//
//  TodayViewController.swift
//  IOS11AppStoreClone
//
//  Created by Ajay Singh on 26/10/17.
//  Copyright © 2017 Ajay Singh. All rights reserved.
//

import UIKit

class TodayViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    let modelTransition = ModelTransitionAnimator()
    
    var collectionView:UICollectionView = {let collectionView = UICollectionView(frame:CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        return collectionView;
        
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Today"
        
        configureCollectionView()
    }
    
    func configureCollectionView() ->Void{
        self.view.addSubview(collectionView)
        collectionView.register(ImageViewCardCell.self, forCellWithReuseIdentifier: "imageViewCard")
      //  collectionView.backgroundColor = UIColor(red: 223/255, green: 226/255, blue: 229/255, alpha: 1)
        collectionView.backgroundColor = UIColor.white
        let layoutGuide = self.view.safeAreaLayoutGuide
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor, constant: 0).isActive = true
        collectionView.topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor, constant: 0).isActive = true
        collectionView.dataSource = self
        let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout;
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left:20, bottom: 0, right:20)
        collectionView.delegate = self
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageViewCard", for: indexPath) as! ImageViewCardCell
        cell.configure(index: indexPath.row)
        //Using weak because otherwise will cause reference cycle
        cell.onCardTap = {[weak self]()->Void in
          //  self?.present(TodayDetailViewController(), animated: true, completion: nil)
        
            
            //self?.navigationController?.pushViewController(TodayDetailViewController(), animated: true)
        }
        return cell;
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.size.width-40, height: 400)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let today = TodayDetailViewController()
        today.transitioningDelegate = self
//        today.modalPresentationStyle = .custom;
        guard let cell = collectionView.cellForItem(at: indexPath) else {
            return;
        }
        let cellFrame = collectionView.convert(cell.frame, to: collectionView.superview)
        modelTransition.originFrame = cellFrame;
        present(today, animated: true, completion: nil);
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension TodayViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        modelTransition.presenting = true
        return modelTransition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return nil;
    }
}

class ImageViewCardCell:UICollectionViewCell{//UIGestureRecognizerDelegate{
    private var tap: UITapGestureRecognizer!
    var onCardTap:(()->Void)?
    let cardView:UIView = {
       let cardView = UIView()
        cardView.backgroundColor = UIColor.white
        cardView.layer.cornerRadius = 10
        cardView.layer.masksToBounds = true
        cardView.isUserInteractionEnabled = true
        return cardView
    }()
    
    let imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "CardImage5")
        return imageView
    }()
    
    var getAppButton:UIButton =  {
        var submitButton = UIButton()
        submitButton.setTitle("$6.88", for: UIControlState.normal)
        submitButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.bold)
        submitButton.setTitleColor(UIColor(red: 0/255, green: 149/255, blue: 255/255, alpha: 1), for: UIControlState.normal)
        submitButton.layer.cornerRadius = 12
        submitButton.layer.masksToBounds = true
        submitButton.backgroundColor =  UIColor(red: 224/255, green: 230/255, blue: 236/255, alpha: 1)
        return submitButton
        
    }()
    
    var metaDataLabel:UILabel = {
        var metaDataLabel = UILabel()
        metaDataLabel.numberOfLines=0
        metaDataLabel.font = UIFont.systemFont(ofSize: 14)
        metaDataLabel.textColor = UIColor.white
        metaDataLabel.text = "Sheep game which everyone plays"
        return metaDataLabel
    }()
    
    var appDescriptionLabel:UILabel = {
        var appDescriptionLabel = UILabel()
        appDescriptionLabel.numberOfLines=0
        appDescriptionLabel.font = UIFont.boldSystemFont(ofSize: 40)
        appDescriptionLabel.textColor = UIColor.white
        appDescriptionLabel.text = "GAME OF THE DAY"
        return appDescriptionLabel
    }()
   
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupSubViews()
    }
    
    func setupSubViews() ->Void{
        self.contentView.addSubview(cardView)
    //    tap = UITapGestureRecognizer(target: self, action: #selector(self.cardTapped))
    //    cardView.addGestureRecognizer(tap)
        //tap.delegate = self
      //  tap.cancelsTouchesInView = false
        cardView.snp.makeConstraints { (make) in
            make.leading.trailing.equalTo(self.contentView)
            make.top.equalTo(self.contentView).offset(20)
            make.bottom.equalTo(self.contentView).offset(-20)
        }
        
        cardView.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.leading.trailing.top.bottom.equalTo(cardView)
        }
        cardView.addSubview(getAppButton)
        getAppButton.snp.makeConstraints { (make) in
            make.trailing.equalTo(cardView).offset(-15)
            make.width.equalTo(80)
            make.height.equalTo(30)
            make.bottom.equalTo(cardView).offset(-20)
        }
        
        cardView.addSubview(metaDataLabel)
        metaDataLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(cardView).offset(15)
            make.width.equalTo(150)
            make.bottom.equalTo(cardView).offset(-20)
        }
        
        cardView.addSubview(appDescriptionLabel)
        
        appDescriptionLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(cardView).offset(15)
            make.width.equalTo(150)
            make.top.equalTo(cardView).offset(100)
        }
        
    }
    
     @objc  func cardTapped(){
        self.onCardTap?()
    }
    
  /*  override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.2) {
            self.cardView.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }
    }
    
    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.2) {
            self.cardView.transform = CGAffineTransform.identity
        }
    }*/
    
    func configure(index:Int){
        if(index>0){
            imageView.image = UIImage(named: "CardImage4")
        }
    }
}
