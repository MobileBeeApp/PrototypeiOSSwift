//
//  WeatherModelFutureValues.swift
//  Prototype
//
//  Created by Eugen Puzynin.
//

import Foundation

struct WeatherModelFutureValues {
    let lat: Double
    let lon: Double
    let tempDay: Double
    let tempNight: Double
    let dt: Int
    let humidity: Int
    let uvi: Double
    let windSpeed: Double
    let conditionWeatherId: Int

    
    var tempDayString: String {
        return String(format: "%.0f", tempDay)
    }
    
    var tempNightString: String {
        return String(format: "%.0f", tempNight)
    }
    
    var dtString: String {
        return String(dt)
    }
    
    var humidityString: String {
        return String(humidity)
    }

    var uviString: String {
        return String(format: "%.0f", uvi)
    }
    
    var windSpeedString: String {
        return String(format: "%.0f", windSpeed * 3.6)
    }
    var conditionNameId: String {
        
        switch conditionWeatherId {
        
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
