//
//  AsteroidDistance.swift
//  Nasa Api Tests
//
//  Created by Chrystian on 06/11/18.
//  Copyright © 2018 Chrystian Salgado. All rights reserved.
//

import Foundation

struct AsteroidDistance {
    var astronomical: Float?
    var lunar: Float?
    var kilometers: Float?
    var miles: Float?
    
    enum CodingKeys: String, CodingKey {
        case astronomical = "astronomical"
        case lunar = "lunar"
        case kilometers = "kilometers"
        case miles = "miles"
    }
}

extension AsteroidDistance: Decodable {
    init (from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        astronomical = try values.decodeIfPresent(Float.self, forKey: .astronomical)
        lunar = try values.decodeIfPresent(Float.self, forKey: .lunar)
        kilometers = try values.decodeIfPresent(Float.self, forKey: .kilometers)
        miles = try values.decodeIfPresent(Float.self, forKey: .miles)
    }
}
