//
//  NetworkModel.swift
//  NewsAppTest
//
//  Created by Эдгар Исаев on 23.10.2023.
//

import Foundation

struct News: Decodable {
    let status: String
    let totalResults: Int
    let results: [NetworkModel]
    let nextPage: String
}

struct NetworkModel: Decodable {
    let title: String
    let creator: [String]?
    let description, content, pubDate: String?
    let imageURL: String?
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case creator = "creator"
        case description = "description"
        case content = "content"
        case pubDate = "pubDate"
        case imageURL = "image_url"
    }
}
