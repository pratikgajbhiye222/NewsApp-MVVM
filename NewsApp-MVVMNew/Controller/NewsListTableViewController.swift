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

        tableView.dataSource = viewModel
        setup()
        viewModel.reloadSections = { [weak self] (section: Int) in
            DispatchQueue.main.async {

                self?.tableView.reloadData()
            }
        }


        tableView.register(NewssTableViewCell.nib, forCellReuseIdentifier: NewssTableViewCell.identifier)
    }
    
    private func setup(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
}
