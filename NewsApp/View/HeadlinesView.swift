//
//  HeadlinesView.swift
//  NewsApp
//
//  Created by Ashiq Sulaiman on 23/07/19.
//  Copyright © 2019 Ashiq Sulaiman. All rights reserved.
//

import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return realm.objects(Article.self).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "headCell") as! HeadlineCell
        let article = realm.objects(Article.self)[indexPath.item]
        cell.setupCell(with: article)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = realm.objects(Article.self)[indexPath.item]
        Router().loadDetailView(with: article)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 207.0
    }
    
}
