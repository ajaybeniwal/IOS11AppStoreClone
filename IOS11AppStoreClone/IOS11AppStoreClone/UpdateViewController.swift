//
//  UpdateViewController.swift
//  IOS11AppStoreClone
//
//  Created by Ajay Singh on 26/10/17.
//  Copyright © 2017 Ajay Singh. All rights reserved.
//

import UIKit

class UpdateViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    let tableView:UITableView = {
        let tableView = UITableView(frame: CGRect.zero)
        tableView.estimatedRowHeight = 80
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Updates"
        tableView.register(UpdateTableViewCell.self, forCellReuseIdentifier: "updateCell")
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "updateCell", for: indexPath) as! UpdateTableViewCell
        return cell;
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
}





class UpdateTableViewCell :UITableViewCell{
    var numberTypeLabel:UILabel = {
        var productTypeLabel = UILabel()
        productTypeLabel.font = UIFont.systemFont(ofSize: 16)
        productTypeLabel.textColor = UIColor.black
        productTypeLabel.text = "Uber"
        productTypeLabel.numberOfLines = 0;
        return productTypeLabel
        
    }()
    
    var getAppButton:UIButton =  {
        var submitButton = UIButton()
        submitButton.setTitle("UPDATE", for: UIControlState.normal)
        submitButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.bold)
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
        productTypeLabel.text = "Version 61.03.45.67"
        return productTypeLabel
    }()
    var appImageView:UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "Uber")
        imageView.layer.cornerRadius = 6
        imageView.layer.masksToBounds = true
        imageView.layer.borderColor = UIColor(red: 214/255, green: 214/255, blue: 214/255, alpha: 1).cgColor
        
        return imageView
    }()
    
    var appDescriptionLabel:UILabel = {
        var appDescriptionLabel = UILabel()
        appDescriptionLabel.font = UIFont.systemFont(ofSize: 16)
        appDescriptionLabel.textColor = UIColor.black
        appDescriptionLabel.text = "We are listening to feedback and working hard to improve app"
        appDescriptionLabel.numberOfLines = 0;
        return appDescriptionLabel
        
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpSubViews()
    }
    
    func setUpSubViews(){
       // self.contentView.addSubview(numberTypeLabel)
        self.contentView.addSubview(appImageView)
        appImageView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(numberTypeLabel)
        numberTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(metaDataLabel)
        metaDataLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(getAppButton)
        getAppButton.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(appDescriptionLabel)
        appDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        /*Setting autolayout constraint using layout anchors instead of snapkit so that it is easy for beginners to learn */
        appImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        appImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        appImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        appImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        
       numberTypeLabel.leadingAnchor.constraint(equalTo: appImageView.trailingAnchor, constant: 10).isActive = true
       numberTypeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        getAppButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15).isActive = true
        getAppButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        getAppButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        metaDataLabel.leadingAnchor.constraint(equalTo: appImageView.trailingAnchor, constant: 10).isActive = true
        metaDataLabel.topAnchor.constraint(equalTo: numberTypeLabel.bottomAnchor, constant: 5).isActive = true
        
        appDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        
        appDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        
        appDescriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        
        appDescriptionLabel.topAnchor.constraint(equalTo: appImageView.bottomAnchor, constant: 5).isActive = true
        
    }
    
    
}
