//
//  RealmExtensions.swift
//  NewsApp
//
//  Created by Ashiq Sulaiman on 24/07/19.
//  Copyright © 2019 Ashiq Sulaiman. All rights reserved.
//

import Foundation
import RealmSwift

extension Results {
    func toArray<T>(ofType: T.Type) -> [T] {
        let array = Array(self) as! [T]
        return array
    }
}
