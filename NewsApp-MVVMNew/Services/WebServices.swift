//
//  WebServices.swift
//  NewsApppNayaWala
//
//  Created by pratik gajbhiye on 12/07/20.
//  Copyright © 2020 Mobile. All rights reserved.
//

import Foundation
class WebServices {
    func getArticles(url: URL , completion: @escaping(ArticlesList)-> Void){
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                return
            }
            print(data)
            
            do
            {
                let responceObject = try JSONDecoder().decode(ArticlesList.self, from: data)
                completion(responceObject)
                print(responceObject)
                return
            }
            catch {
                print("sfsdf")
                return
            }
            
        }
        task.resume()
    }
}
