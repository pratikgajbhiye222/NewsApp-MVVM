//
//  Array+Extension.swift
//  NewsApp-MVVMNew
//
//  Created by pratik gajbhiye on 16/07/20.
//  Copyright © 2020 Mobile. All rights reserved.
//

import Foundation

extension Array where Element : Hashable {
    func filterDuplicates() -> Array<Element>{
        var set = Set<Element>()
        var fileredArray = Array<Element>()
        for item in self {
            if set.insert(item).inserted
            {
                fileredArray.append(item)
            }
        }
        return fileredArray
    }
}
