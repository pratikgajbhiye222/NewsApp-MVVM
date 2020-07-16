//
//  NewssTableViewCell.swift
//  NewsApp-MVVMNew
//
//  Created by pratik gajbhiye on 13/07/20.
//  Copyright © 2020 Mobile. All rights reserved.
//

import UIKit

class NewssTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var deescription : UILabel!
    
    
    var item: Articles2? {
        didSet{
            guard let item = item  else {
                return
            }
            
            if let title = self.title {
                title.text = item.title
                print("\(String(describing: item.title))")
            }
            if let des = self.deescription {
                des.text = item.descriptionDetails
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


