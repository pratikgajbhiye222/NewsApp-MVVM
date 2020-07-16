//
//  WebServices.swift
//  NewsApppNayaWala
//
//  Created by pratik gajbhiye on 12/07/20.
//  Copyright © 2020 Mobile. All rights reserved.
//

import Foundation
class NetworkManeger{
    
    static let shared = NetworkManeger()
    
    func loadData(onSuccess: @escaping (ArticlesList2)-> Void){
        
        let url = URL(string: "http://newsapi.org/v2/everything?q=bitcoin&from=2020-06-16&sortBy=publishedAt&apiKey=ebb1d816fc8c47faaba6f41af62f1d27")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
           guard let data = data else {
                return
            }
            let responseObject : [String: AnyObject]!
            do {
                responseObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject]
                print(responseObject as Any)
                if let articleslist2 = ArticlesList2(data: responseObject) {
                    DispatchQueue.main.async {
                    onSuccess(articleslist2)
                    }
                }
            }catch{
                print("error")
                return
            }
        }
        task.resume()
    }
}
