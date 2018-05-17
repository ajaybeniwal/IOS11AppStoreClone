//
//  TodayDetailViewController.swift
//  IOS11AppStoreClone
//
//  Created by Ajay Singh on 2/11/17.
//  Copyright © 2017 Ajay Singh. All rights reserved.
//

import UIKit

class TodayDetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let tableView:UITableView = {
        let _tableView = UITableView(frame: CGRect.zero)
        _tableView.estimatedRowHeight = 400
        _tableView.tableFooterView = UIView()
        return _tableView
    }()
    override func viewDidLoad() {
        self.view.superview?.backgroundColor = UIColor.red
        super.viewDidLoad()
        self.navigationItem.largeTitleDisplayMode = .never
        self.view.backgroundColor = UIColor.white
        self.title = "Detail"
        tableView.delegate = self
        tableView.dataSource = self
        configureTableView()
        tableView.register(TodayDetailDescriptionTableViewCell.self, forCellReuseIdentifier: "todayDescriptionCell")
        tableView.register(TodayDetailImageTableViewCell.self, forCellReuseIdentifier: "todayDescriptionImageCell")
    }
    
    func configureTableView(){
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.bottom.leading.trailing.equalTo(self.view)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row==0){
            let cell =  tableView.dequeueReusableCell(withIdentifier: "todayDescriptionImageCell", for: indexPath) as! TodayDetailImageTableViewCell
            cell.onCardTap = {[weak self]()->Void in
                self?.dismiss(animated: true, completion: nil)
            }
            return cell;
        }
        else{
            let cell =  tableView.dequeueReusableCell(withIdentifier: "todayDescriptionCell", for: indexPath) as! TodayDetailDescriptionTableViewCell
            return cell;
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    

   

}


class TodayDetailDescriptionTableViewCell : UITableViewCell{
    var metaDataLabel:UILabel = {
        var metaDataLabel = UILabel()
        metaDataLabel.numberOfLines=0
        metaDataLabel.font = UIFont.systemFont(ofSize: 20)
        metaDataLabel.textColor = UIColor.lightGray
        metaDataLabel.text = "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc."
        return metaDataLabel
    }()
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpSubViews()
    }
    func setUpSubViews(){
        self.contentView.addSubview(metaDataLabel)
         metaDataLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(self.contentView).offset(15)
            make.trailing.equalTo(self.contentView).offset(-15)
            make.top.equalTo(self.contentView).offset(20)
            make.bottom.equalTo(self.contentView).offset(-20)
        }
        
    }
}
class TodayDetailImageTableViewCell :UITableViewCell{
    var onCardTap:(()->Void)?
    var appImageView:UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "CardImage5")
        return imageView
    }()
    
    var cancelImageView:UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "Cancel")
        return imageView
    }()
    var metaDataLabel:UILabel = {
        var metaDataLabel = UILabel()
        metaDataLabel.numberOfLines=0
        metaDataLabel.font = UIFont.boldSystemFont(ofSize: 22)
        metaDataLabel.textColor = UIColor.white
        metaDataLabel.text = "Sheep game which everyone plays"
        return metaDataLabel
    }()
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpSubViews()
    }
    func setUpSubViews(){
        self.contentView.addSubview(appImageView)
        appImageView.snp.makeConstraints { (make) in
            make.leading.trailing.equalTo(self.contentView)
            make.top.bottom.equalTo(self.contentView)
            make.height.equalTo(400)
        }
        self.contentView.addSubview(cancelImageView)
        cancelImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.contentView).offset(20);
            make.trailing.equalTo(self.contentView).offset(-15);
            
        }
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.cardTapped))
        cancelImageView.isUserInteractionEnabled = true
        cancelImageView.addGestureRecognizer(tap)
        self.contentView.addSubview(metaDataLabel)
        metaDataLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(self.contentView).offset(15)
            make.width.equalTo(200)
            make.top.equalTo(self.contentView).offset(20)
        }
        
    }
    
    @objc  func cardTapped(){
        self.onCardTap?()
    }
}
