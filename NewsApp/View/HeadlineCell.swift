//
//  HeadlineCell.swift
//  NewsApp
//
//  Created by Ashiq Sulaiman on 23/07/19.
//  Copyright © 2019 Ashiq Sulaiman. All rights reserved.
//

import UIKit
import SDWebImage

class HeadlineCell: UITableViewCell {

    @IBOutlet weak var thumbnnailImageView: UIImageView!
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    let colours = ColourScheme()
    let articleVM = ArticleViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        thumbnnailImageView.addGradientToView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(with article: Article){
        thumbnnailImageView?.sd_setImage(with: URL(string: article.urlToImage ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
        headlineLabel.text = article.title
        sourceLabel.text = article.source?.sourceName
        dateLabel.text = articleVM.convertDateFormat(article.publishedAt!)
    }
    
    func setupUI(){
        self.contentView.backgroundColor = colours.bgColor
        headlineLabel.font = UIFont.appBoldFontWith(size: 20.0)
        sourceLabel.font = UIFont.appRegularFontWith(size: 12.0)
        dateLabel.font = UIFont.appRegularFontWith(size: 12.0)
        headlineLabel.textColor = colours.mainTextColor
        dateLabel.textColor = colours.subTextColor
        sourceLabel.textColor = colours.subTextColor
        thumbnnailImageView.contentMode = .scaleAspectFill
        thumbnnailImageView.clipsToBounds = true
        
    }

}
