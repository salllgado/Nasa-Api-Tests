//
//  ApodObjModel.swift
//  Nasa Api Tests
//
//  Created by Chrystian on 01/11/18.
//  Copyright © 2018 Chrystian Salgado. All rights reserved.
//

import Foundation

struct ApodObjModel: Decodable {
    var copyright: String?
    var date: String?
    var explanation: String?
    var hdurl: String?
    var mediaType: String?
    var serviceVersion: String?
    var title: String?
    var url: String?
    
    enum CodingKeys: String, CodingKey {
        case copyright = "copyright"
        case date = "date"
        case explanation = "explanation"
        case hdurl = "hdurl"
        case mediaType = "media_type"
        case serviceVersion = "service_version"
        case title = "title"
        case url = "url"
    }
}
