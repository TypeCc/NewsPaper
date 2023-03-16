//
//  NewsModel.swift
//  NewsPaper
//
//  Created by serif mete on 16.03.2023.
//

import Foundation

// MARK: - News
struct NewsModel: Codable {
    let articles: [Article]?
}
// MARK: - Article
struct Article: Codable {
    let url: String?
    let title: String?
}

