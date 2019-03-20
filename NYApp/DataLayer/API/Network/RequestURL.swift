//
//  RequestURL.swift
//  NYApp
//
//  Created by Taha Abdelrahman on 3/19/19.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation
class RequestURL{
    //https://
    private init(){}
    
    static let shared = RequestURL()
    
    private func apiKey()->String{
        return "Ag6ZJM9D5kJmQXUa3BlRZjg9O1xvw8Id"
    }
    
    private  func getBaseURL(addPath:String) -> URLComponents {
        var urlComponent = URLComponents()
        urlComponent.scheme = "https"
        urlComponent.host = "api.nytimes.com"
        urlComponent.path = "/svc/" + addPath
        return urlComponent
    }
}
extension RequestURL{
    
    public func mostPopularViewedURL(period:String)->URLComponents{
        
        var url:URLComponents = getBaseURL(addPath: "mostpopular/v2/viewed/\(period).json")
        var urlQueryItem:[URLQueryItem] = []
        urlQueryItem.append(URLQueryItem(name: "api-key", value: apiKey()))
        url.queryItems = urlQueryItem
        return url
    }
}
