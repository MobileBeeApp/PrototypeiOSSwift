//
//  WeatherData.swift
//  Prototype
//
//  Created by Eugen Puzynin.
//

import Foundation

struct WeatherData: Codable {
    
    let coord: Coord
    let name: String
    let main: Main
    let weather: [Weather]
    let wind: Wind
    
}

struct Coord: Codable {
    
    let lon: Double
    let lat: Double
    
}

struct Main: Codable {
    
    let temp: Double
    let humidity: Double
    
}

struct Weather: Codable {
    
    let id: Int
    
}

struct Wind: Codable {
    
    let speed: Double
    
}
