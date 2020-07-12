//
//  NewsTableViewCell.swift
//  NewsApp-MVVMNew
//
//  Created by pratik gajbhiye on 13/07/20.
//  Copyright © 2020 Mobile. All rights reserved.
//

import Foundation
import UIKit

class NewsTableViewCell: UITableViewCell {
    
   
    @IBOutlet weak var one : UILabel!
    @IBOutlet weak var two : UILabel!
    
    var item: Article? {
        didSet{
            guard let item = item  else {
                return
            }
            if let title = one {
                title.text = item.title
            }
            if let des = two {
                des.text = item.description
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    static var identifier: String {
        return String(describing: self)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}


