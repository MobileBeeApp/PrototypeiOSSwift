//
//  WeatherDataWithFuture.swift
//  Prototype
//
//  Created by Eugen Puzynin.
//

import Foundation

struct WeatherDataWithFuture: Codable {
    let lon: Double
    let lat: Double
    let current: Current
    let daily: [Daily]
}

struct Current: Codable {
    let dt: Int
    let temp: Double
    let humidity: Int
    let uvi: Double
    let wind_speed: Double
    let weather: [WeatherCurrent]
    
}

struct WeatherCurrent: Codable {
    let id: Int
}


struct Daily: Codable {
    let dt: Int
    let temp: Temp
    let humidity: Int
    let wind_speed: Double
    let uvi: Double
    let weather: [WeatherFuture]
}

struct Temp: Codable {
    let day: Double
    let night: Double
}

struct WeatherFuture: Codable {
    let id: Int
}
