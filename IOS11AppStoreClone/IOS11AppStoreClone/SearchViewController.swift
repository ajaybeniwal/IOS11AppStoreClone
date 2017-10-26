//
//  SearchViewController.swift
//  PlayStoreClone
//
//  Created by Ajay Singh on 15/6/17.
//  Copyright © 2017 Ajay Singh. All rights reserved.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController,UISearchBarDelegate,UISearchControllerDelegate,UISearchResultsUpdating,UITableViewDelegate,UITableViewDataSource {
    let tableView:UITableView = {
        let _tableView = UITableView(frame: CGRect.zero)
        _tableView.estimatedRowHeight = 44
        _tableView.tableFooterView = UIView()
        return _tableView
    }()
    
    
    @available(iOS 8.0, *)
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    let searchController:UISearchController = {
       let search = UISearchController(searchResultsController: nil)
        return search
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Search"
        searchController.delegate = self;
        self.navigationItem.searchController = searchController
        self.view.addSubview(tableView)
        tableView.register(SearchTableCell.self, forCellReuseIdentifier: "SearchCell")
        tableView.delegate = self
        tableView.dataSource = self
        configureTableView()
        
    }
    
    func configureTableView(){
        tableView.snp.makeConstraints { (make) in
            make.top.bottom.leading.trailing.equalTo(self.view)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as! SearchTableCell
        return cell;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let uiView = UIView()
        let headerLabel = UILabel()
        headerLabel.text = "Trending"
        headerLabel.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.bold)
        uiView.addSubview(headerLabel)
        headerLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(uiView).offset(15)
            make.trailing.equalTo(uiView).offset(-15)
            make.bottom.equalTo(uiView).offset(-10)
            
        }
        return uiView
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailController = SearchDetailViewController()
        self.navigationController?.pushViewController(detailController, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
}


class SearchTableCell :UITableViewCell{
    var numberTypeLabel:UILabel = {
        var productTypeLabel = UILabel()
        productTypeLabel.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.semibold)
        productTypeLabel.textColor = UIColor(red: 0/255, green: 149/255, blue: 255/255, alpha: 1)
        productTypeLabel.text = "Cricket Live Tv"
        productTypeLabel.numberOfLines = 0;
        return productTypeLabel
        
    }()
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpSubViews()
    }
    
    func setUpSubViews(){
        self.contentView.addSubview(numberTypeLabel)
        numberTypeLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(self.contentView).offset(15)
            make.trailing.equalTo(self.contentView).offset(-15)
            make.top.equalTo(self.contentView).offset(10)
            make.bottom.equalTo(self.contentView).offset(-10)
        }
    }
    
    
}
