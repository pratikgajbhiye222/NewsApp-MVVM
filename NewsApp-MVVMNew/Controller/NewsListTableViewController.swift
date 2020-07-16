//
//  NewsListTableViewController.swift
//  NewsApppNayaWala
//
//  Created by pratik gajbhiye on 12/07/20.
//  Copyright © 2020 Mobile. All rights reserved.
//

import Foundation
import UIKit

class NewsListTableViewController: UIViewController {
    
    let viewModel = NewsViewModel()
    @IBOutlet weak var tableView : UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadData()
        viewModel.delegate = self
        tableView.dataSource = viewModel
        setup()
        tableView.register(NewssTableViewCell.nib, forCellReuseIdentifier: NewssTableViewCell.identifier)
    }
    
    private func setup(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
}
extension NewsListTableViewController: ArticleModelDelegate {
    
    func didFinishUpdate() {
            self.tableView?.reloadData()
    }
    
    func apply(changes: SectionChanges) {
        self.tableView.beginUpdates()
        self.tableView.deleteSections(changes.deletes, with: .fade)
        self.tableView.insertSections(changes.inserts, with: .fade)
        self.tableView.reloadRows(at: changes.updates.reloads, with: .left)
        self.tableView.insertRows(at: changes.updates.inserts, with: .right)
        self.tableView.deleteRows(at: changes.updates.deletes, with: .bottom)
       }
    
}
