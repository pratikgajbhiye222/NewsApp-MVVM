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
        setup()
        viewModel.reloadSections = { [weak self] (section: Int) in
            DispatchQueue.main.async {

                self?.tableView.dataSource = self?.viewModel
                self?.tableView.reloadData()
            }
        }


        tableView?.register(NewsTableViewCell.nib, forCellReuseIdentifier: NewsTableViewCell.identifier)
    }
    
    private func setup(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
}
