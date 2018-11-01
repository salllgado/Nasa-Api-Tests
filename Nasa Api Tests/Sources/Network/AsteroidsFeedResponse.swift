//
//  AsteroidsFeedResponse.swift
//  Nasa Api Tests
//
//  Created by Chrystian on 31/10/18.
//  Copyright © 2018 Chrystian Salgado. All rights reserved.
//

import Foundation

struct AsteroidsFeedResponse {
    var elementCount: Int?
    
    enum CodinKeys: String, CodingKey {
        case elementCount = "element_count"
    }
}

extension AsteroidsFeedResponse: Decodable {
    public init(from decoder: Decoder) {
        let values = try decoder.container(keyedBy: CodinKeys.self)
        elementCount = try values.decodeIfPresent(String.self, forKey: .elementCount)?.toInt()
    }
}

extension String {
    func toInt() -> Int {
        return Int(self)!
    }
}
