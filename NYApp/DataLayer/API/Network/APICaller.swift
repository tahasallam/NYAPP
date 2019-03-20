//
//  APICaller.swift
//  NYApp
//
//  Created by Taha Abdelrahman on 3/19/19.
//  Copyright © 2019 apple. All rights reserved.
//


import Foundation
import SwiftyJSON
import Alamofire
import Localize_Swift

class APICaller<ClassType:APIProtocol>{
    
    class func callGet(url:String,completion:@escaping(ClassType?,Error?)->Void){
        Alamofire.request(url, method: .get, encoding: JSONEncoding.default).validate().responseJSON(completionHandler: { response in
            switch response.result{
            case .success:
                if let resulteValue = response.result.value{
                    completion(ClassType(json: JSON(resulteValue)),nil)
                }
                break
            case .failure(let error):
                
                completion(nil,error)
                break
            }
        })
    }
}
