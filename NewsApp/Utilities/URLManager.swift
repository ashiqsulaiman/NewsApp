//
//  URLManager.swift
//  NewsApp
//
//  Created by Ashiq Sulaiman on 23/07/19.
//  Copyright © 2019 Ashiq Sulaiman. All rights reserved.
//

import Foundation
import Alamofire

class NewsAPI: NSObject{
    var baseURL: URL {
        return URL(string: "https://newsapi.org/v2/")!
    }
    func get(path: String) -> URL{
        return URL(string: path, relativeTo: baseURL)!
    }
}

class NewsEndpoint: NSObject {
    private let apiKey: String = "8fcade6581c04e0e8e5481dde33def52"
    func getHeadlines(for Country: String) -> URL{
        return NewsAPI().get(path: "top-headlines?country=\(Country)&apiKey=\(apiKey)")
    }
}

