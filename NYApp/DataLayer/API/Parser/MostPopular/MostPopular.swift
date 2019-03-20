//
//  Welcome.swift
//  NYApp
//
//  Created by Taha Abdelrahman on 3/19/19.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation
import SwiftyJSON

class MostPopular:APIProtocol{
    
    public let status, copyright: String?
    public let numResults: Int?
    public let results: [Result]?
    
    enum CodingKeys: String {
        case status, copyright
        case numResults = "num_results"
        case results
    }
    
    public init(status: String, copyright: String, numResults: Int, results: [Result]) {
        self.status = status
        self.copyright = copyright
        self.numResults = numResults
        self.results = results
    }
    
    required init(json: JSON) {
        self.status = json[CodingKeys.status.rawValue].string
        self.copyright = json[CodingKeys.copyright.rawValue].string
        self.numResults = json[CodingKeys.numResults.rawValue].int
        self.results = json[CodingKeys.results.rawValue].arrayValue.map{Result.init(json: $0)}
    }
}

extension MostPopular{
    class func getMostPopular(completion:@escaping(MostPopular?,Error?)->Void){
        guard let mostPopularUrl = RequestURL.shared.mostPopularViewedURL(period: "7").string  else{
            return
        }
        
        
        APICaller<MostPopular>.callGet(url:mostPopularUrl , completion: {item ,error in
            completion(item,error)
        })
    }
}
