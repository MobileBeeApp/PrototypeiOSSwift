//
//  PollutionConditionModel.swift
//  Prototype
//
//  Created by Eugen Puzynin.
//

import Foundation

//are saved herewith so that I can output them on the screen in the next step
struct PollutionConditionModel {
    
    let aqi: Int
    let co: Double
    let no: Double
    let no2: Double
    let o3: Double
    let so2: Double
    let pm2_5: Double
    let pm10: Double
    let nh3: Double
    let dt: Double
    
    //all as a string so that I can pass it to the labels as a string when viewing. 
    var aqiString: String {
        
        return String(aqi)
    }
    
    var coString: String {
        
        return String(format: "%.0f", co)
        
    }
    
    var noString: String {
        
        return String(format: "%.0f", no)
    }
    
    var no2String: String {
        
        return String(format: "%.0f", no2)
    }
    
    var o3String: String {
        
        return String(format: "%.0f", o3)
    }
    
    var so2String: String {
        
        return String(format: "%.0f", so2)
    }
    
    var pm2_5String: String {
        
        return String(format: "%.0f", pm2_5)
    }
    
    var pm10String: String {
        
        return String(format: "%.0f", pm10)
    }
    
    var nh3String: String {
        
        return String(format: "%.0f", nh3)
    }
    
    var dtString: String {
        
        return String(format: "%.0f", dt)
    }
}
