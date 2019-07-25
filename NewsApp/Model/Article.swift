//
//  Article.swift
//  NewsApp
//
//  Created by Ashiq Sulaiman on 23/07/19.
//  Copyright © 2019 Ashiq Sulaiman. All rights reserved.
//

import Foundation
import RealmSwift

class Response: Object, Decodable {
    @objc dynamic var status: String = ""
    @objc dynamic var totalResults: Int = 0
    dynamic var allArticles = List<Article>()
    
    override static func primaryKey() -> String? {
        return "totalResults"
    }
    
    private enum CodingKeys: String, CodingKey{
        case status
        case totalResults
        case allArticles = "articles"
        
    }
    
    public required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.totalResults =  try container.decode(Int.self, forKey: .totalResults)
        let resultsArray = try container.decode([Article].self, forKey: .allArticles)
            for item in resultsArray{
                allArticles.append(item)
            }
    }
}


class Article: Object, Decodable {
    @objc dynamic var source: Source?
    @objc dynamic var author: String?
    @objc dynamic var title: String = ""
    @objc dynamic var articleDescription: String?
    @objc dynamic var url: String?
    @objc dynamic var urlToImage: String?
    @objc dynamic var publishedAt: String?
    @objc dynamic var content: String?
    
    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }
    
    public required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.source = try container.decode(Source.self, forKey: .source)
        self.author = try container.decodeIfPresent(String.self, forKey: .author)
        self.title = try container.decode(String.self, forKey: .title)
        self.articleDescription = try container.decodeIfPresent(String.self, forKey: .articleDescription)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
        self.urlToImage = try container.decodeIfPresent(String.self, forKey: .urlToImage)
        self.publishedAt = try container.decodeIfPresent(String.self, forKey: .publishedAt)
        self.content = try container.decodeIfPresent(String.self, forKey: .content)
    }
}


class Source: Object, Decodable {
    @objc dynamic var id: String?
    @objc dynamic var sourceName: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case sourceName = "name"
    }
    
    public required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.sourceName = try container.decodeIfPresent(String.self, forKey: .sourceName)
    }
}
