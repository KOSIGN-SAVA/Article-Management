//
//  ViewController.swift
//  MVP
//
//  Created by Vansa Pha on 12/12/16.
//  Copyright © 2016 Vansa Pha. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ApiProtocol {

    var article:[Articles]=[]
    var list=ListArticles()
    
    var eventHandler : ListPresenter?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventHandler=ListPresenter()
        eventHandler.
        list.delegate=self
        tableView.delegate=self
        tableView.dataSource=self
        if article.count==0{
            list.fetchArticleData()
        }else{
            tableView.reloadData()
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return article.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "apicell", for: indexPath) as! DataCellTableViewCell
        cell.title.text=article[indexPath.row].title
        return cell
    }
}

