//
//  DetailViewController.swift
//  NewsApp
//
//  Created by Ashiq Sulaiman on 23/07/19.
//  Copyright © 2019 Ashiq Sulaiman. All rights reserved.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {

    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    let colours = ColourScheme()
    var selectedArticle: Article?
    let articleVM = ArticleViewModel()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        updateView()
    }
    
    func updateView(){
        if let article = selectedArticle {
        headlineLabel.text = article.title
        sourceLabel.text = article.source?.sourceName
        dateLabel.text = articleVM.convertDateFormat(article.publishedAt!)
        contentLabel.text = article.content
        articleImage?.sd_setImage(with: URL(string: article.urlToImage ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
        }
    }
    
    func setupUI(){
        headlineLabel.font = UIFont.appBoldFontWith(size: 29)
        sourceLabel.font = UIFont.appRegularFontWith(size: 20.0)
        dateLabel.font = UIFont.appRegularFontWith(size: 20.0)
        contentLabel.font = UIFont.appRegularFontWith(size: 12.0)
        headlineLabel.textColor = colours.mainTextColor
        dateLabel.textColor = colours.mainTextColor
        sourceLabel.textColor = colours.mainTextColor
        contentLabel.textColor = colours.subTextColor
        articleImage.contentMode = .scaleAspectFill
        self.view.backgroundColor = colours.navBarTheme
    }

    @IBAction func dismissView(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
