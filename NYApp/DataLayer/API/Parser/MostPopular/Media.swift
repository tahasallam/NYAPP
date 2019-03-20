//
//  Media.swift
//  NYApp
//
//  Created by Taha Abdelrahman on 3/19/19.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation
import SwiftyJSON

public class Media: APIProtocol {
   
    
    public let subtype,type,caption, copyright: String?
    public let approvedForSyndication: Int?
    public let mediaMetadata: [MediaMetadatum]?
    
    enum CodingKeys: String, CodingKey {
        case type, subtype, caption, copyright
        case approvedForSyndication = "approved_for_syndication"
        case mediaMetadata = "media-metadata"
    }
    
    public init(type: String, subtype: String, caption: String?, copyright: String?, approvedForSyndication: Int, mediaMetadata: [MediaMetadatum]) {
        self.type = type
        self.subtype = subtype
        self.caption = caption
        self.copyright = copyright
        self.approvedForSyndication = approvedForSyndication
        self.mediaMetadata = mediaMetadata
    }
    
    required init(json: JSON) {
        self.type = json[CodingKeys.type.rawValue].string
        self.subtype = json[CodingKeys.subtype.rawValue].string
        self.caption = json[CodingKeys.caption.rawValue].string
        self.copyright = json[CodingKeys.copyright.rawValue].string
        self.approvedForSyndication = json[CodingKeys.approvedForSyndication.rawValue].int
        
        self.mediaMetadata = json[CodingKeys.mediaMetadata.rawValue].arrayValue.map{MediaMetadatum.init(json: $0)}
    }
}
