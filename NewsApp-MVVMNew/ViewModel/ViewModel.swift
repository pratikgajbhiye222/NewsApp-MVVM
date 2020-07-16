//
//  ViewModel.swift
//  NewsApp-MVVMNew
//
//  Created by pratik gajbhiye on 13/07/20.
//  Copyright © 2020 Mobile. All rights reserved.
//

import Foundation
import UIKit
enum NewsViewModelItemType : String{
    case titleAndDescription = "titleAndDescription"
}


protocol NewsViewModelItem {
    var type: NewsViewModelItemType { get }
    var sectionTitle: String  { get }
    //
    var cellItems: [CellItem] { get }
}

struct CellItem: Equatable {
   
    var value : CustomStringConvertible
    var id : String
    
    static func == (lhs: CellItem , rhs : CellItem)-> Bool {
        return lhs.id == rhs.id && lhs.value.description == rhs.value.description
    }
}


class NewsViewModelTitleItem: NewsViewModelItem {
    var cellItems: [CellItem] {
        return articles.map{ CellItem(value: $0, id: $0.title)}
    }
    
    var type: NewsViewModelItemType {
        return .titleAndDescription
    }
    var sectionTitle: String {
        return "Main Info"
    }
  
    var articles: [Articles2]
    init(articles: [Articles2]) {
        self.articles = articles
    }
}
protocol ArticleModelDelegate:
class {
    func didFinishUpdate()
    func apply(changes: SectionChanges)
}


class NewsViewModel : NSObject{
    var items = [NewsViewModelItem]()
    weak var delegate : ArticleModelDelegate?
    //MARK: - Initilization
    func loadData(){
        NetworkManeger.shared.loadData { [weak self](artists) in
            self?.parseData(articlesList2: artists)
        }
    }
    
    func parseData(articlesList2: ArticlesList2){
        
        //        guard let data = dataFromFile("ServerData"), let profile = Profile(data: data) else {
        //                  return
        //              }
        items.removeAll()
        let articles2 = articlesList2.articles
        if !articles2.isEmpty {
            let articleitems = NewsViewModelTitleItem(articles: articles2)
            items.append(articleitems)
        }
        delegate?.didFinishUpdate()
    }
    
    private func setup(newItems: [NewsViewModelItem]){
        let oldData = flatten(items: items)
        let newData = flatten(items: newItems)
        let sectionChanges = DiffCalculator.calculate(oldItems: oldData, newItems: newData)
        items = newItems
        delegate?.apply(changes: sectionChanges)
        
        
    }
    
    private func flatten(items: [NewsViewModelItem]) -> [ReloadableSection<CellItem>]{
        let reloadableitems = items.enumerated().map{ReloadableSection(key: $0.element.type.rawValue, value: $0.element.cellItems.enumerated().map{ReloadableCell(key: $0.element.id, value: $0.element, index: $0.offset)}, index: $0.offset)}
    return reloadableitems
}

    
}
extension NewsViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].cellItems.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // we will configure the cells here
        let item = items[indexPath.section]
        switch item.type {
        case .titleAndDescription:
            if let item = item as? NewsViewModelTitleItem ,let cell = tableView.dequeueReusableCell(withIdentifier: NewssTableViewCell.identifier, for: indexPath) as? NewssTableViewCell {
                print(item.articles.count)
                let items = item.articles[indexPath.row]
                cell.item = items
                return cell
            }
        }
        return UITableViewCell()
    }
}

