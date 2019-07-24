//
//  ArticleViewModel.swift
//  NewsApp
//
//  Created by Ashiq Sulaiman on 23/07/19.
//  Copyright © 2019 Ashiq Sulaiman. All rights reserved.
//

import Foundation
import RealmSwift

class ArticleViewModel: NSObject {
    let topVC = UIApplication.topViewController()
    let articleArray = [Article]()
    let realm = try! Realm()
    override init() {
  
    }
    
    func numberOfRowsInSection() -> Int {
        return articleArray.count
    }
    
    func fetchArticles(onCompletion: @escaping (Bool) -> ()){
        NetworkManager.sharedInstance().performNetworkOperation(url: NewsEndpoint().getHeadlines(for: "us"), httpMethod: .get, parameters: [:], blockActivityOnLoader: true, shouldHandleError: false) { (response) in
            let realm = try! Realm()
            guard let data = response.data else { self.topVC?.view.makeToast("No articles fetched"); return}
            do  {
                let decoder = JSONDecoder()
                let getData = try decoder.decode(Response.self, from: data)
                try! realm.write {
                    realm.create(Response.self, value: getData, update: true)
                    onCompletion(true)
                }
            } catch {
                print("Error: \(error.localizedDescription)")
                onCompletion(false)
            }
        }
    }
    
    func getArticles(){
        fetchArticles { (success) in
            if success == true {
                let realm = try! Realm()
                let articles = realm.objects(Article.self)
                print(articles)
            }
        }
        
    }
}
