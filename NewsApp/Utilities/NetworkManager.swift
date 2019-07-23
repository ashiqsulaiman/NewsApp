//
//  NetworkManager.swift
//  NewsApp
//
//  Created by Ashiq Sulaiman on 23/07/19.
//  Copyright © 2019 Ashiq Sulaiman. All rights reserved.
//

import Foundation
import Alamofire
import RealmSwift
import Toast_Swift

class NetworkManager: NSObject{
    static let sharedNetworkManager = NetworkManager()
    let headers = ["Content-Type": "application/JSON"]
    class func sharedInstance() -> NetworkManager{
        return NetworkManager.sharedNetworkManager
    }
    
    
    func performNetworkOperation(url: URL, httpMethod: HTTPMethod, parameters:Dictionary<String, Any>?, blockActivityOnLoader block: Bool = true, shouldHandleError handleError: Bool, completion: @escaping(_ success:DataResponse<Any>) -> Void){
        if NetworkReachabilityManager()!.isReachable{
            Loader.shared.showLoader()
            let encoding: ParameterEncoding
            if (httpMethod == .put || httpMethod == .post) { encoding = JSONEncoding.default } else{
                encoding = URLEncoding.default
            }
            Alamofire.request(url, method: httpMethod, parameters: parameters,encoding: encoding,  headers: headers).responseJSON { (response) in
                Loader.shared.hideLoader()
                guard let status = response.response?.statusCode else {
                    return
                }
                if 200 ... 299 ~= status {
                    completion(response)
                }else{
                    UIApplication.topViewController()?.view.makeToast("Failed with response \(status)")
                }
            }
        }else{
            //            display the no internet toast
            UIApplication.topViewController()?.view.makeToast("No Internet Connection.")
        }
    }
    
}
