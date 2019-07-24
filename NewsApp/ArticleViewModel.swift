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
    
    func getArticles(completion: @escaping (Bool) -> ()) {
        NetworkManager.sharedInstance().performNetworkOperation(url: NewsEndpoint().getHeadlines(for: "us"), httpMethod: .get, parameters: [:], blockActivityOnLoader: true, shouldHandleError: false) { (response) in
            let realm = try! Realm()
            guard let data = response.data else { self.topVC?.view.makeToast("No articles fetched"); return}
            do  {
                let decoder = JSONDecoder()
                let getData = try decoder.decode(Response.self, from: data)
                try! realm.write {
                    realm.create(Response.self, value: getData, update: true)
                }
                completion(true)
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func articleArrar() -> [Article] {
        return realm.objects(Article.self).toArray(ofType: Article.self)
    }
    
    func convertDateFormat(_ date: String) -> String {
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "yyyy-MM-dd"
        
        if let date = dateFormatterGet.date(from: date) {
            return dateFormatterPrint.string(from: date)
        } else {
            return "err"
        }
        
    }

}
