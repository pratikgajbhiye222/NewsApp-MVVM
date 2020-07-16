//
//  DataModel.swift
//  NewsApppNayaWala
//
//  Created by pratik gajbhiye on 13/07/20.
//  Copyright © 2020 Mobile. All rights reserved.
//
import Foundation

// MARK: - Articles
struct ArticlesList: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    let title: String?
    let descriptionDetails: String?
}

// MARK: - Source



class ArticlesList2 : Decodable {
    var articles = [Articles2]()
    init?(data: [String: AnyObject]?) {
        if let data = data, let articles = data["articles"] as? [Any] {
            self.articles = articles.compactMap{ Articles2(json: $0 as? [String: Any]) }
        } else {
            return
        }
    }
}

class Articles2 : Decodable {
    var title: String = ""
    var descriptionDetails: String = ""
    init?(json: [String: Any]?) {
        guard let json = json else {
            return nil
        }
        self.title = json["title"] as? String ?? ""
        self.descriptionDetails = json["description"] as? String ?? ""
    }
}

extension Articles2 : CustomStringConvertible {
    var description: String {
    return "\(title):\(descriptionDetails)"
    }
}

