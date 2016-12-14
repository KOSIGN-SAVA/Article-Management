//
//  ViewController.swift
//  MVP
//
//  Created by Vansa Pha on 12/12/16.
//  Copyright © 2016 Vansa Pha. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    var articles:[Article]=[]
    
    var eventHandler : ListPresenter? // is un object, it's waiting for persenter notify and run
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eventHandler = ListPresenter()
        eventHandler?.attactProtocol(self)
        
        tableView.delegate=self
        tableView.dataSource=self
        
        //step 1
        eventHandler?.getArticle()
        
    }
}
/*
    table implementation
 */
extension ViewController:UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "apicell", for: indexPath) as! DataCellTableViewCell
        cell.title.text=articles[indexPath.row].title
        return cell
    }

}

/////////////////////////////////////////////////////////////
/// conform to list protocol wich is notified by presenter // 
/////////////////////////////////////////////////////////////

extension ViewController:ListViewProtocol{
    func apiRespondData(_ data: [Article]) {
        // yoo data mor tam nis
        
        articles.append(contentsOf: data) // step 6 dol view vinh bat 
        tableView.reloadData()
        
    }
    
    func apiRespondNothing() {
        // a nis pel ot data
        
    }
    
    func apiError() {
        // api face probleme
        
    }
    
    func startFetching() {
        
    }
    
    func finishFetching() {
        
    }
}

