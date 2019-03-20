//
//  Result.swift
//  NYApp
//
//  Created by Taha Abdelrahman on 3/19/19.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation
import SwiftyJSON

class Result: APIProtocol {
    
    
    let url: String?
    let adxKeywords: String?
    let column: String?
    let section, byline: String?
    let type: String?
    let title, abstract, publishedDate: String?
    let source: String?
    let id, assetID, views: Int?
    let perFacet, geoFacet,desFacet, orgFacet: [String]?
    let media: [Media]?
    let uri: String?
    
    enum CodingKeys: String, CodingKey {
        case url
        case adxKeywords = "adx_keywords"
        case column, section, byline, type, title, abstract
        case publishedDate = "published_date"
        case source, id
        case assetID = "asset_id"
        case views
        case desFacet = "des_facet"
        case orgFacet = "org_facet"
        case perFacet = "per_facet"
        case geoFacet = "geo_facet"
        case media, uri
    }
    
    init(url: String, adxKeywords: String, column: String?, section: String, byline: String, type: String, title: String, abstract: String, publishedDate: String, source: String, id: Int, assetID: Int, views: Int, desFacet: [String], orgFacet: [String], perFacet: [String], geoFacet: [String], media: [Media], uri: String) {
        self.url = url
        self.adxKeywords = adxKeywords
        self.column = column
        self.section = section
        self.byline = byline
        self.type = type
        self.title = title
        self.abstract = abstract
        self.publishedDate = publishedDate
        self.source = source
        self.id = id
        self.assetID = assetID
        self.views = views
        self.desFacet = desFacet
        self.orgFacet = orgFacet
        self.perFacet = perFacet
        self.geoFacet = geoFacet
        self.media = media
        self.uri = uri
    }
    
    required init(json: JSON) {
        self.url = json[CodingKeys.url.rawValue].stringValue
        self.adxKeywords = json[CodingKeys.adxKeywords.rawValue].stringValue
        self.column = json[CodingKeys.column.rawValue].stringValue
        self.section = json[CodingKeys.section.rawValue].stringValue
        self.byline = json[CodingKeys.byline.rawValue].stringValue
        self.type = json[CodingKeys.type.rawValue].stringValue
        self.title = json[CodingKeys.title.rawValue].stringValue
        self.abstract = json[CodingKeys.abstract.rawValue].stringValue
        self.publishedDate = json[CodingKeys.publishedDate.rawValue].stringValue
        self.source = json[CodingKeys.source.rawValue].stringValue
        self.id = json[CodingKeys.id.rawValue].int
        self.assetID = json[CodingKeys.views.rawValue].int
        self.views = json[CodingKeys.views.rawValue].int
        self.desFacet = json[CodingKeys.desFacet.rawValue].arrayValue.map{$0.stringValue}
        self.orgFacet = json[CodingKeys.orgFacet.rawValue].arrayValue.map{$0.stringValue}
        self.perFacet = json[CodingKeys.perFacet.rawValue].arrayValue.map{$0.stringValue}
        self.geoFacet = json[CodingKeys.geoFacet.rawValue].arrayValue.map{$0.stringValue}
        self.media = json[CodingKeys.media.rawValue].arrayValue.map{Media.init(json: $0)}
        self.uri = json[CodingKeys.uri.rawValue].string
    }
}
