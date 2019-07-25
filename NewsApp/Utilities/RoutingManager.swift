//
//  RoutingManager.swift
//  NewsApp
//
//  Created by Ashiq Sulaiman on 23/07/19.
//  Copyright © 2019 Ashiq Sulaiman. All rights reserved.
//

import UIKit

fileprivate enum Storyboard: String {
    case  main = "Main"
}

fileprivate enum ViewControllerIdentifier: String{
    case headlines = "headlinesVC"
    case detail = "detailVC"
}

extension UIApplication {
    @objc class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller:navigationController.visibleViewController)
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller:presented)
        }
        
        return controller
    }
}

fileprivate extension UIStoryboard {
    static func load(from storyboard: Storyboard, identifier: ViewControllerIdentifier) -> UIViewController {
        let uiStoryboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        return uiStoryboard.instantiateViewController(withIdentifier: identifier.rawValue)
    }
}

class Router {
    func popTopViewController(){
        if let topVC = UIApplication.topViewController() {
            topVC.navigationController?.popViewController(animated: true)
        }
    }
    
    func loadDetailView(with article: Article){
        let view: DetailViewController = UIStoryboard.load(from: .main, identifier: .detail) as! DetailViewController
        view.selectedArticle = article
        view.modalTransitionStyle = .crossDissolve
        if let topVC = UIApplication.topViewController() {
            topVC.navigationController?.present(view, animated: true, completion: {})
        }
    }
}

