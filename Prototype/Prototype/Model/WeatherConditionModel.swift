//
//  WeatherConditionModel.swift
//  Prototype
//
//  Created by Eugen Puzynin.
//

import Foundation

//weather object
struct WeatherConditionModel {
    
    let cityName: String
    let lat: Double
    let lon: Double
    let temperature: Double
    let conditionId: Int
    let windSpeed: Double
    let humidity: Double
    
    
    var windSpeedString: String {
        
        //*3.6 to convert from meter / seconds in km / hour
        return String(format: "%.0f", windSpeed * 3.6)
        
    }
    
    var humidityString: String {
        return String(format: "%.0f", humidity)
    }
    
    //temperature mit 1 dezimalstelle
    var temperatureString: String {
        
        return String(format: "%.0f", temperature)
        
    }
    
    var conditionName: String {
        
        switch conditionId {
        
        //first case range between 200 and 232 for Thunderstorm
        case 200...232:
            return "cloud.bolt.fill"
        case 300...321:
            return "cloud.drizzle.fill"
        case 500...531:
            return "cloud.rain.fill"
        case 600...622:
            return "cloud.snow.fill"
        case 701...781:
            return "cloud.fog.fill"
        case 800:
            return "sun.max.fill"
        case 801...804:
            return "cloud.bolt.fill"
        default:
            return "cloud.fill"
            
        }
        
    }
    
}
