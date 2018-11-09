//
//  CSUtils+StringCasts.swift
//  CSUtils
//
//  Created by Chrystian on 06/11/18.
//

import Foundation

public extension String {
    func toInt() -> Int? {
        return Int(self)
    }
    
    func toDouble() -> Double? {
        return Double(self)
    }
    
    func toFloat() -> Float? {
        return Float(self)
    }
    
    func toURL() -> URL? {
        return URL(string: self)
    }
}
