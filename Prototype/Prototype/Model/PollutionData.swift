//
//  PollutionData.swift
//  Prototype
//
//  Created by Eugen Puzynin.
//

import Foundation

struct PollutionData: Decodable {
    let coord: Coord
    let list: [List]
}

struct List: Decodable {
    let main: [String:Int]
    let components: [String:Double]
    let dt: Double
}

