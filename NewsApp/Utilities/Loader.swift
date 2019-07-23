//
//  Loader.swift
//  NewsApp
//
//  Created by Ashiq Sulaiman on 23/07/19.
//  Copyright © 2019 Ashiq Sulaiman. All rights reserved.
//


import UIKit

struct Loader{
    
    static let shared = Loader()
    let topViewController = UIApplication.topViewController()
    let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView.init(style: UIActivityIndicatorView.Style.gray)
    
    func showLoader(){
        topViewController?.view.addSubview(activityIndicator)
        activityIndicator.center = CGPoint(x: UIScreen.main.bounds.size.width / 2, y: UIScreen.main.bounds.size.height / 2)
        activityIndicator.startAnimating()
    }
    
    func hideLoader(){
        activityIndicator.stopAnimating()
    }
    
}
