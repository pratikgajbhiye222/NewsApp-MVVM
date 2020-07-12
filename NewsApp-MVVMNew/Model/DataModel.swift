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
    let title: String
    let description: String
}

// MARK: - Source



