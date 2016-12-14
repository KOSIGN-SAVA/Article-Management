//
//  ListPresenter.swift
//  MVP
//
//  Created by Vansa Pha on 12/13/16.
//  Copyright © 2016 Vansa Pha. All rights reserved.
//

import Foundation

class ListPresenter:ApiProtocol{
    
    var articleData:ArticleData?  // refence
    
    var listViewProtocol:ListViewProtocol?
    
    func attactProtocol(_ listPresenter : ListViewProtocol) {
        self.listViewProtocol = listPresenter
    }
    
    init() {
        articleData = ArticleData() // asing value
        articleData?.attachDelegate(self) // phsa pchab delegate togethe
    }
    
    func getArticle(){ // when you try fetch data
    
        listViewProtocol?.startFetching()
        
        // setp 2
        articleData?.fetchArticle()
    }
    
    
    
    func success(_ data: [Article]) { // step 5
       print("I am presenter and this is my data \(data)")
        
        if data.count == 0 {
            listViewProtocol?.apiRespondNothing()
        }
        else{
            listViewProtocol?.apiRespondData(data)
        }
    }
    
    func error() { // step 5
        print("I am presenter but Aip i error, ")
        listViewProtocol?.apiError()
    }
}

protocol ListViewProtocol {
    func startFetching()
    func finishFetching()
    func apiRespondData(_ data: [Article])
    func apiRespondNothing()
    func apiError()
}
