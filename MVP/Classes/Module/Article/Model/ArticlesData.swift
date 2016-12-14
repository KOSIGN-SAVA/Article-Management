//
//  ArticlesData.swift
//  MVP
//
//  Created by Vansa Pha on 12/13/16.
//  Copyright © 2016 Vansa Pha. All rights reserved.
//

import Foundation

class ArticleData{

    var delegate:ApiProtocol?
    
    func attachDelegate(_ aipProtocol : ApiProtocol){
        self.delegate = aipProtocol
    }
    
    func fetchArticle(){
        //Create URL request source
        let url=URL(string: ARTICLE_URL)
        //Create HTTP request for prepare request to server
        var request=URLRequest(url: url!)
        //Setup header
        request.addValue(HEADER, forHTTPHeaderField: ATHENTICATION)
        request.addValue("*/*", forHTTPHeaderField: "Accept")
        //Craete
        let session=URLSession.shared
        
        // step 3
        session.dataTask(with: request, completionHandler: {(responseBody, httpResponse, error) in
            if error == nil {
                let json=try! JSONSerialization.jsonObject(with: responseBody!, options: .allowFragments) as! [String:AnyObject]
                
                let arrayData = json["DATA"] as! [AnyObject]
                
                var arrayArticle:[Article]=[]
                
                for eachData in arrayData {
                    var article = Article()
                    if !(eachData["ID"] is NSNull){
                        article.id = eachData["ID"] as! Int
                    }
                    
                    if !(eachData["TITLE"] is NSNull){
                        article.title = eachData["TITLE"] as! String
                    }
                    arrayArticle.insert(article, at: 0)
                }
                self.delegate?.success(arrayArticle) // step 4 backward to presenter
            }
            else{
                self.delegate?.error() // step 4 forward to presenter
            }
        }).resume()
    }
}

protocol ApiProtocol{
    func success(_ data:[Article])
    func error()
}
