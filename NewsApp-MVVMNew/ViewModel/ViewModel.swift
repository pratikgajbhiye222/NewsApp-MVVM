//
//  ViewModel.swift
//  NewsApp-MVVMNew
//
//  Created by pratik gajbhiye on 13/07/20.
//  Copyright © 2020 Mobile. All rights reserved.
//

import Foundation
import UIKit
enum NewsViewModelItemType {
   case titleAndDescription
}


protocol NewsViewModelItem {
   var type: NewsViewModelItemType { get }
   var rowCount: Int { get }
   var sectionTitle: String  { get }
}

extension NewsViewModelItem {
   var rowCount: Int {
      return 1
   }
}
class NewsViewModelTitleItem: NewsViewModelItem {
   var type: NewsViewModelItemType {
    return .titleAndDescription
   }
   var sectionTitle: String {
      return "Main Info"
   }
    var articles: [Article]
    init(articles: [Article]) {
        self.articles = articles
    }
}



class NewsViewModel : NSObject{
    var items = [NewsViewModelItem]()
    var reloadSections: ((_ section: Int) -> Void)?
    //MARK: - Initilization
    override init() {
        super.init()
        let url = URL(string: "http://newsapi.org/v2/everything?q=bitcoin&from=2020-06-12&sortBy=publishedAt&apiKey=ebb1d816fc8c47faaba6f41af62f1d27")!
        WebServices().getArticles(url: url) { (articlesllist) in
            if !articlesllist.isEmpty {
                let newlistItem = NewsViewModelTitleItem(articles: articlesllist)
                    self.items.append(newlistItem)
            }
        }
    }
}

extension NewsViewModel: UITableViewDataSource {
   func numberOfSections(in tableView: UITableView) -> Int {
      return items.count
   }
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return items[section].rowCount
   }
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   // we will configure the cells here
    let item = items[indexPath.section]
           switch item.type {
           case .titleAndDescription:
            if let item = item as? NewsViewModelTitleItem ,let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier, for: indexPath) as? NewsTableViewCell {
                cell.item = item.articles[indexPath.row]
                
                   return cell
               }
           }
           return UITableViewCell()
       }
   }

