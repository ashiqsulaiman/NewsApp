//
//  FontConfig.swift
//  NewsApp
//
//  Created by Ashiq Sulaiman on 23/07/19.
//  Copyright © 2019 Ashiq Sulaiman. All rights reserved.
//

import UIKit

enum AppFontNames: String {
    case regular = "RobotoSlab-Regular"
    case bold = "RobotoSlab-Bold"
}

extension UIFont {
    class func appRegularFontWith( size: CGFloat) -> UIFont {
        return UIFont(name: AppFontNames.regular.rawValue, size: size)!
    }
    
    class func appBoldFontWith( size: CGFloat) -> UIFont {
        return UIFont(name: AppFontNames.bold.rawValue, size: size)!
    }
}
