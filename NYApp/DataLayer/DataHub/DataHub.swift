//
//  DataHub.swift
//  NYApp
//
//  Created by Taha Abdelrahman on 3/19/19.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation
class DataHub{
    class func getMostPopular(completion:@escaping(MostPopular?,Error?)->Void){
        MostPopular.getMostPopular(completion: {
            mostPopular,error in
            completion(mostPopular,error)
        })
    }
}
