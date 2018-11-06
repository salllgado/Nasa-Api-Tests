//
//  AsteroidsModel.swift
//  Nasa Api Tests
//
//  Created by Chrystian on 06/11/18.
//  Copyright © 2018 Chrystian Salgado. All rights reserved.
//

import Foundation
import CSUtils

struct AsteroidsModel {
    var id: Int
    var neoReferenceId: Int
    var name: String
    var links: [String]?
    var isPotentiallyHazardousAsteroid: Bool?
    var missDistance: [AsteroidDistance]?
    var orbitingBody: String?
    var isSentryObject: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case neoReferenceId = "neo_reference_id"
        case name
        case links
        case isPotentiallyHazardousAsteroid = "is_potentially_hazardous_asteroid"
        case missDistance = "miss_distance"
        case orbitingBody = "orbiting_body"
        case isSentryObject = "is_sentry_object"
    }
    
    enum LinksCodingKeys: String, CodingKey {
        case link = "self"
    }
}

extension AsteroidsModel: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id).toInt()!
        neoReferenceId = try values.decode(String.self, forKey: .neoReferenceId).toInt()!
        name = try values.decode(String.self, forKey: .name)
        
        let linksContainer = try decoder.container(keyedBy: LinksCodingKeys.self)
        links = try linksContainer.decodeIfPresent([String].self, forKey: .link)
        
        isPotentiallyHazardousAsteroid = try values.decodeIfPresent(Bool.self, forKey: .isPotentiallyHazardousAsteroid)
        missDistance = try values.decodeIfPresent([AsteroidDistance].self, forKey: .missDistance)
        orbitingBody = try values.decodeIfPresent(String.self, forKey: .orbitingBody)
        isSentryObject = try values.decode(Bool.self, forKey: .isSentryObject)
    }
}

struct AsteroidsList: Decodable {
    
    var nearEarthObjects: AsteroidsPerData
    
    enum CodingKeys: String, CodingKey {
        case nearEarthObjects = "near_earth_objects"
    }
}

struct AsteroidsPerData: Decodable {
    var firstDay: [AsteroidsModel]
    var secondDay: [AsteroidsModel]
    
    enum CodingKeys: String, CodingKey {
        case firstDay = "2015-09-07"
        case secondDay = "2015-09-08"
    }
}
