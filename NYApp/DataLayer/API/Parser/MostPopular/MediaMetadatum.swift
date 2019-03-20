//
//  MediaMetadatum.swift
//  NYApp
//
//  Created by Taha Abdelrahman on 3/19/19.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation
import SwiftyJSON

public class MediaMetadatum: APIProtocol {
    
    public let url: String?
    public let format: String?
    public let height, width: Int?
    
    public enum CodingKeys: String, CodingKey {
        case url
        case format
        case height
        case width
    }
    
    public init(url: String, format: String, height: Int, width: Int) {
        self.url = url
        self.format = format
        self.height = height
        self.width = width
    }
    
    required init(json: JSON) {
        self.url = json[CodingKeys.url.rawValue].string
        self.format = json[CodingKeys.format.rawValue].string
        self.height = json[CodingKeys.height.rawValue].int
        self.width = json[CodingKeys.width.rawValue].int
    }
}
