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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        thumbnnailImageView.layer.masksToBounds = true
        thumbnnailImageView.contentMode = .scaleAspectFill
        thumbnnailImageView.clipsToBounds = true
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(with article: Article){
//        headlineLabel.text = article.title
//        sourceLabel.text = article.source?.name ?? ""
//        dateLabel.text = article.publishedAt ?? ""
        thumbnnailImageView?.sd_setImage(with: URL(string: article.urlToImage ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
    }
    
}
