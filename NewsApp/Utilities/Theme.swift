//
//  Colors.swift
//  NewsApp
//
//  Created by Ashiq Sulaiman on 23/07/19.
//  Copyright © 2019 Ashiq Sulaiman. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }
}

class ColourScheme {
    var navBarTheme: UIColor {
        get {
            return UIColor.black
        }
    }
    var navBarTitleColor: UIColor {
        get {
            return UIColor.white
        }
    }
    var bgColor: UIColor {
        get {
            return UIColor(displayP3Red: 70/255.0, green: 70/255.0, blue: 70/255.0, alpha: 1)
        }
    }
    var mainTextColor: UIColor {
        get {
            return UIColor(displayP3Red: 242/255.0, green: 242/255.0, blue: 242/255.0, alpha: 1)
        }
    }
    var subTextColor: UIColor {
        get {
            return UIColor(displayP3Red: 186/255.0, green: 186/255.0, blue: 186/255.0, alpha: 1)
        }
    }
}

extension UIView {
    func addGradientToView(){
        let gradientLayer:CAGradientLayer = CAGradientLayer()
        gradientLayer.frame.size = self.frame.size
        gradientLayer.colors =
            [UIColor.clear.cgColor,UIColor.black.withAlphaComponent(1).cgColor]
        self.layer.addSublayer(gradientLayer)
    }
}
