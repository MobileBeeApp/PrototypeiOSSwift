//
//  APIManager.swift
//  Prototype
//
//  Created by Eugen Puzynin.
//

import Foundation
import CoreLocation

//Delegate to be able to give the values of weather and pollution to viewcontroller
protocol APIManagerDelegate {
    
    func didUpdateFutureWeather(_ apiManager: APIManager, weather: [WeatherModelFutureValues])
    func didUpdateWeather(_ apiManager: APIManager, weather: WeatherConditionModel)
    func didUpdatePollution(_ apiManager: APIManager, pollution: PollutionConditionModel)
    func didUpdatePollutionForecast(_ apiManager: APIManager, pollution: [PollutionConditionModel])
    func didFailWithError(error: Error)
    
}

struct APIManager {
    
    //my API Key: 840c61878bfe3a3937775f340a13e46c
    //URL with API Key for OpenWeather (must be https!)
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=840c61878bfe3a3937775f340a13e46c&units=metric"
    
    //URL with API Key for Pollution from OpenWeather
    let pollutionURL = "https://api.openweathermap.org/data/2.5/air_pollution?appid=840c61878bfe3a3937775f340a13e46c"
    
    
    //forecast air pollution
    let forecastPollutionURL =
        "https://api.openweathermap.org/data/2.5/air_pollution/forecast?appid=840c61878bfe3a3937775f340a13e46c"
    var delegate: APIManagerDelegate?
    
    //exclude minutely, hourly, alerts
    let oneAPICallForWeatherUFL =
        "https://api.openweathermap.org/data/2.5/onecall?&exclude=minutely,hourly,alerts&appid=840c61878bfe3a3937775f340a13e46c&units=metric"
    
    
    
    
    
    //Weather URL plus passed string city name (from the text input)
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequestWeather(with: urlString)
        
    }
    
    //Get weather URL with the coordinates
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees){
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequestWeather(with: urlString)
        let urlStringOneAPI = "\(oneAPICallForWeatherUFL)&lat=\(latitude)&lon=\(longitude)"
        
        performRequestFutureWeather(with: urlStringOneAPI)
    }
    
    //FUTURE weather commented out...
//    func fetchFutureWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees){
//        let urlStringOneAPI = "\(oneAPICallForWeatherUFL)&lat=\(latitude)&lon=\(longitude)"
//        performRequestFutureWeather(with: urlStringOneAPI)
//    }
    
    //Pollution URL with lat & lon
    func fetchPollution(lat: Double, lon: Double){
        let urlString = "\(pollutionURL)&lat=\(lat)&lon=\(lon)"
        performRequestPollution(with: urlString)
        let forecastURLString = "\(forecastPollutionURL)&lat=\(lat)&lon=\(lon)"
        //        let date = NSDate(timeIntervalSince1970: 1612101600)
        //FUTURE WEATHER COMMENTED OUT...
//        performRequestPollutionForecast(with: forecastURLString)
        
    }
    
    //FUTURE weather commented out...
//    func performRequestPollutionForecast(with urlString: String) {
//        //1. Create URL
//        if let url = URL(string: urlString) {
//
//            //2. Create a URLSession
//            let session = URLSession(configuration: .default)
//            //3. Give session task
//            let task = session.dataTask(with: url) { (data, response, error) in
//                if error != nil {
//
//                    self.delegate?.didFailWithError(error: error!)
//                    return
//
//                }
//                if let safeData = data {
//
//                    if let pollution = self.parseJSONPollutionForecast(safeData) {
//                        self.delegate?.didUpdatePollutionForecast(self, pollution: pollution)
//
//                    }
//                }
//            }
//
//            //4. Start the task
//            task.resume()
//
//        }
//    }
    
    func getCurrentTime() -> Int{
        // get the current date and time
        let currentDateTime = Date()
        
        // get the user's calendar
        let userCalendar = Calendar.current
        
        // choose which date and time components are needed
        let requestedComponents: Set<Calendar.Component> = [
            .day,
            .hour,
        ]
        
        // get the components
        let dateTimeComponents = userCalendar.dateComponents(requestedComponents, from: currentDateTime)
        return dateTimeComponents.hour!
    }
    
    
    
    func parseJSONFutureWeather(_ weatherData: Data) -> [WeatherModelFutureValues]?{

        let decoder = JSONDecoder()
        var weatherForecast = [WeatherModelFutureValues]()
            do {
                //get data
                let decodedWeatherData = try decoder.decode(WeatherDataWithFuture.self, from: weatherData)
                //save the individual data
                
                //today
                let lat = decodedWeatherData.lat
                let lon = decodedWeatherData.lon
                let tempCurrent = decodedWeatherData.current.temp
                let tempNightFiller = 0.0
                let dt = decodedWeatherData.current.dt
                let humidity = decodedWeatherData.current.humidity
                let uvi = decodedWeatherData.current.uvi
                let windSpeed = decodedWeatherData.current.wind_speed
                let id = decodedWeatherData.current.weather[0].id
                
                weatherForecast.append(WeatherModelFutureValues(lat: lat, lon: lon, tempDay: tempCurrent, tempNight: tempNightFiller, dt: dt, humidity: humidity, uvi: uvi, windSpeed: windSpeed, conditionWeatherId: id))
                
                var i = 1
                while i < 5 {
                    let tempDayFuture = decodedWeatherData.daily[i].temp.day
                    let tempNightFuture = decodedWeatherData.daily[i].temp.night
                    let dtFuture = decodedWeatherData.daily[i].dt
                    let humidityFuture = decodedWeatherData.daily[i].humidity
                    let uviFuture = decodedWeatherData.daily[i].uvi
                    let windSpeedFuture = decodedWeatherData.daily[i].wind_speed
                    let idFuture = decodedWeatherData.daily[i].weather[0].id
                    
                    weatherForecast.append(WeatherModelFutureValues(lat: lat, lon: lon, tempDay: tempDayFuture, tempNight: tempNightFuture, dt: dtFuture, humidity: humidityFuture, uvi: uviFuture, windSpeed: windSpeedFuture, conditionWeatherId: idFuture))
                    i+=1
                }
            } catch {
                
                delegate?.didFailWithError(error: error)
                return nil
                
            }
        return weatherForecast
    }
    
    
    //FUTURE WEATHER COMMENTED OUT...
    //"Index out of range"
//    func parseJSONPollutionForecast(_ weatherData: Data) -> [PollutionConditionModel]?{
//        let decoder = JSONDecoder()
//        var pollutionForecast = [PollutionConditionModel]()
//
//        let currentTime = getCurrentTime()
//
//        var position = currentTime + 48
//        //48 + 24
//        var i = 5
//        while (i > 0) {
//            do {
//                //hole daten
//                let decodedPollutionData = try decoder.decode(PollutionData.self, from: weatherData)
//                //speicher die einzelnen Daten
//                //            let aqi = decodedPollutionData.list[1].main["aqi"]!
//                let aqi = decodedPollutionData.list[position].main["aqi"]!
//                let co = decodedPollutionData.list[position].components["co"]!
//                let no = decodedPollutionData.list[position].components["no"]!
//                let no2 = decodedPollutionData.list[position].components["no2"]!
//                let o3 = decodedPollutionData.list[position].components["o3"]!
//                let so2 = decodedPollutionData.list[position].components["so2"]!
//                let pm2_5 = decodedPollutionData.list[position].components["pm2_5"]!
//                let pm10 = decodedPollutionData.list[position].components["pm10"]!
//                let nh3 = decodedPollutionData.list[position].components["nh3"]!
//                let dt = decodedPollutionData.list[position].dt
    //
//                pollutionForecast.append(PollutionConditionModel(aqi: aqi, co: co, no: no, no2: no2, o3: o3, so2: so2, pm2_5: pm2_5, pm10: pm10, nh3: nh3, dt: dt))
//
//            } catch {
//
//                delegate?.didFailWithError(error: error)
//                return nil
//
//            }
//            i -= 1
//            position += 24
//        }
//
//        //            let pollution = PollutionConditionModel(aqi: aqi, co: co, no: no, no2: no2, o3: o3, so2: so2, pm2_5: pm2_5, pm10: pm10, nh3: nh3, dt: dt)
//        //            return pollution
//
//        return pollutionForecast
        
//    }
    
    
    func performRequestFutureWeather(with urlString: String) {
        //1. Create URL
        if let url = URL(string: urlString) {
            
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
            //3. Give session task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    
                    self.delegate?.didFailWithError(error: error!)
                    return
                    
                }
                if let safeData = data {
                    
                    if let weather = self.parseJSONFutureWeather(safeData) {
                        //sending weather back to ViewController
                        self.delegate?.didUpdateFutureWeather(self, weather: weather)
                        
                    }
                }
            }
            
            //4. Start the task
            task.resume()
            
        }
    }
    
    
    
    //networking for weather
    func performRequestWeather(with urlString: String) {
        
        //1. Create URL
        if let url = URL(string: urlString) {
            
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
            //3. Give session task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    
                    self.delegate?.didFailWithError(error: error!)
                    return
                    
                }
                if let safeData = data {
                    
                    if let weather = self.parseJSONWeather(safeData) {
                        //sending weather back to ViewController
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            
            //4. Start the task
            task.resume()
            
        }
    }
    
    //networking for pollution
    func performRequestPollution(with urlString: String) {
        
        //1. Create URL
        if let url = URL(string: urlString) {
            
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
            //3. Give session task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    
                    self.delegate?.didFailWithError(error: error!)
                    return
                    
                }
                if let safeData = data {
                    
                    if let pollution = self.parseJSONPollution(safeData) {
                        self.delegate?.didUpdatePollution(self, pollution: pollution)
                        
                    }
                }
            }
            
            //4. Start the task
            task.resume()
            
        }
    }
    
    
    //inform compiler how data is structured for weatherData
    func parseJSONWeather(_ weatherData: Data) -> WeatherConditionModel?{
        
        let decoder = JSONDecoder()
        do {
            //get data
            let decodedWeatherData = try decoder.decode(WeatherData.self, from: weatherData)
            //save the individual data
            let lat = decodedWeatherData.coord.lat
            let lon = decodedWeatherData.coord.lon
            let cityName = decodedWeatherData.name
            let temperature = decodedWeatherData.main.temp
            let id = decodedWeatherData.weather[0].id
            let windSpeed = decodedWeatherData.wind.speed
            let humidity = decodedWeatherData.main.humidity
            
            //pass lat and lon so that the values for pollution (second url link) can be fetched
            fetchPollution(lat: lat, lon: lon)
            
            let weather = WeatherConditionModel(cityName: cityName, lat: lat, lon: lon, temperature: temperature, conditionId: id, windSpeed: windSpeed, humidity: humidity)
            return weather
            
        } catch {
            
            print(error)
            return nil
            
        }
    }
    
    
    //inform compiler how data is structured for pollution DAta
    func parseJSONPollution(_ weatherData: Data) -> PollutionConditionModel?{
        
        let decoder = JSONDecoder()
        do {
            //get data
            let decodedPollutionData = try decoder.decode(PollutionData.self, from: weatherData)
            //save the individual data
            let aqi = decodedPollutionData.list[0].main["aqi"]!
            let co = decodedPollutionData.list[0].components["co"]!
            let no = decodedPollutionData.list[0].components["no"]!
            let no2 = decodedPollutionData.list[0].components["no2"]!
            let o3 = decodedPollutionData.list[0].components["o3"]!
            let so2 = decodedPollutionData.list[0].components["so2"]!
            let pm2_5 = decodedPollutionData.list[0].components["pm2_5"]!
            let pm10 = decodedPollutionData.list[0].components["pm10"]!
            let nh3 = decodedPollutionData.list[0].components["nh3"]!
            
            let pollution = PollutionConditionModel(aqi: aqi, co: co, no: no, no2: no2, o3: o3, so2: so2, pm2_5: pm2_5, pm10: pm10, nh3: nh3, dt: 0)
            return pollution
            
        } catch {
            
            delegate?.didFailWithError(error: error)
            return nil
            
        }
    }
}

