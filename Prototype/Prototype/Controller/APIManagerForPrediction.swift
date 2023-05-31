//
//  APIManagerForPrediction.swift
//  Prototype
//
//  Created by Eugen Puzynin.
//

import UIKit

class APIManagerForPrediction: UIViewController {
    
    @IBOutlet weak var condition1: UIImageView!
    @IBOutlet weak var condition2: UIImageView!
    @IBOutlet weak var condition3: UIImageView!
    @IBOutlet weak var condition4: UIImageView!
    
    @IBOutlet weak var temperatureDay1: UILabel!
    @IBOutlet weak var temperatureDay2: UILabel!
    @IBOutlet weak var temperatureDay3: UILabel!
    @IBOutlet weak var temperatureDay4: UILabel!
    
    @IBOutlet weak var temperatureNight1: UILabel!
    @IBOutlet weak var temperatureNight2: UILabel!
    @IBOutlet weak var temperatureNight3: UILabel!
    @IBOutlet weak var temperatureNight4: UILabel!
    
    @IBOutlet weak var humidity1: UILabel!
    @IBOutlet weak var humidity2: UILabel!
    @IBOutlet weak var humidity3: UILabel!
    @IBOutlet weak var humidity4: UILabel!
    
    @IBOutlet weak var windSpeed1: UILabel!
    @IBOutlet weak var windSpeed2: UILabel!
    @IBOutlet weak var windSpeed3: UILabel!
    @IBOutlet weak var windSpeed4: UILabel!
    
    @IBOutlet weak var uvi1: UILabel!
    @IBOutlet weak var uvi2: UILabel!
    @IBOutlet weak var uvi3: UILabel!
    @IBOutlet weak var uvi4: UILabel!
    
    @IBOutlet weak var date1Label: UILabel!
    @IBOutlet weak var date2Label: UILabel!
    @IBOutlet weak var date3Label: UILabel!
    @IBOutlet weak var date4Label: UILabel!
    
    @IBOutlet weak var aqi1Label: UILabel!
    @IBOutlet weak var aqi2Label: UILabel!
    @IBOutlet weak var aqi3Label: UILabel!
    @IBOutlet weak var aqi4Label: UILabel!
    
    @IBOutlet weak var co1Label: UILabel!
    @IBOutlet weak var co2Label: UILabel!
    @IBOutlet weak var co3Label: UILabel!
    @IBOutlet weak var co4Label: UILabel!
    
    @IBOutlet weak var no1Label: UILabel!
    @IBOutlet weak var no2Label: UILabel!
    @IBOutlet weak var no3Label: UILabel!
    @IBOutlet weak var no4Label: UILabel!
    
    @IBOutlet weak var no2_1Label: UILabel!
    @IBOutlet weak var no2_2Label: UILabel!
    @IBOutlet weak var no2_3Label: UILabel!
    @IBOutlet weak var no2_4Label: UILabel!
    
    @IBOutlet weak var o3_1Label: UILabel!
    @IBOutlet weak var o3_2Label: UILabel!
    @IBOutlet weak var o3_3Label: UILabel!
    @IBOutlet weak var o3_4Label: UILabel!
    
    @IBOutlet weak var so2_1Label: UILabel!
    @IBOutlet weak var so2_2Label: UILabel!
    @IBOutlet weak var so2_3Label: UILabel!
    @IBOutlet weak var so2_4Label: UILabel!
    
    @IBOutlet weak var pm2_5_1Label: UILabel!
    @IBOutlet weak var pm2_5_2Label: UILabel!
    @IBOutlet weak var pm2_5_3Label: UILabel!
    @IBOutlet weak var pm2_5_4Label: UILabel!
    
    @IBOutlet weak var pm10_1Label: UILabel!
    @IBOutlet weak var pm10_2Label: UILabel!
    @IBOutlet weak var pm10_3Label: UILabel!
    @IBOutlet weak var pm10_4Label: UILabel!
    
    @IBOutlet weak var nh3_1Label: UILabel!
    @IBOutlet weak var nh3_2Label: UILabel!
    @IBOutlet weak var nh3_3Label: UILabel!
    @IBOutlet weak var nh3_4Label: UILabel!
    
    override func viewDidLoad() {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yy"
        
        temperatureDay1.text = "\(YYY[1].tempDayString)°"
        temperatureNight1.text = "\(YYY[1].tempNightString)°"
        humidity1.text = "\(YYY[1].humidityString) %"
        windSpeed1.text = "\(YYY[1].windSpeedString) km/hr"
        uvi1.text = YYY[1].uviString
        if YYY[1].uvi > 11 {
            self.uvi1.backgroundColor = UIColor.systemRed
        } else if YYY[1].uvi > 8 {
            self.uvi1.backgroundColor = UIColor.systemOrange
        } else if YYY[1].uvi > 6 {
            self.uvi1.backgroundColor = UIColor.systemYellow
        } else if YYY[1].uvi > 3 {
            self.uvi1.backgroundColor = UIColor.systemGreen
        } else if YYY[1].uvi >= 0 {
            self.uvi1.backgroundColor = UIColor.systemTeal
        }

//        condition1.image = UIImage(systemName: YYY[1].conditionNameId)?.withRenderingMode(.alwaysOriginal)
        condition1.image = UIImage(systemName: YYY[1].conditionNameId)
        temperatureDay2.text = "\(YYY[2].tempDayString)°"
        temperatureNight2.text = "\(YYY[2].tempNightString)°"
        humidity2.text = "\(YYY[2].humidityString) %"
        windSpeed2.text = "\(YYY[2].windSpeedString) km/hr"
        uvi2.text = YYY[2].uviString
        if YYY[2].uvi > 11 {
            self.uvi2.backgroundColor = UIColor.systemRed
        } else if YYY[2].uvi > 8 {
            self.uvi2.backgroundColor = UIColor.systemOrange
        } else if YYY[2].uvi > 6 {
            self.uvi2.backgroundColor = UIColor.systemYellow
        } else if YYY[2].uvi > 3 {
            self.uvi2.backgroundColor = UIColor.systemGreen
        } else if YYY[2].uvi >= 0 {
            self.uvi2.backgroundColor = UIColor.systemTeal
        }
        
//        condition2.image = UIImage(systemName: YYY[2].conditionNameId)?.withRenderingMode(.alwaysOriginal)
        condition2.image = UIImage(systemName: YYY[2].conditionNameId)
        temperatureDay3.text = "\(YYY[3].tempDayString)°"
        temperatureNight3.text = "\(YYY[3].tempNightString)°"
        humidity3.text = "\(YYY[3].humidityString) %"
        windSpeed3.text = "\(YYY[3].windSpeedString) km/hr"
        uvi3.text = YYY[3].uviString
        if YYY[3].uvi > 11 {
            self.uvi3.backgroundColor = UIColor.systemRed
        } else if YYY[3].uvi > 8 {
            self.uvi3.backgroundColor = UIColor.systemOrange
        } else if YYY[3].uvi > 6 {
            self.uvi3.backgroundColor = UIColor.systemYellow
        } else if YYY[3].uvi > 3 {
            self.uvi3.backgroundColor = UIColor.systemGreen
        } else if YYY[3].uvi >= 0 {
            self.uvi3.backgroundColor = UIColor.systemTeal
        }
        
//        condition3.image = UIImage(systemName: YYY[3].conditionNameId)?.withRenderingMode(.alwaysOriginal)
        condition3.image = UIImage(systemName: YYY[3].conditionNameId)
        temperatureDay4.text = "\(YYY[4].tempDayString)°"
        temperatureNight4.text = "\(YYY[4].tempNightString)°"
        humidity4.text = "\(YYY[4].humidityString) %"
        windSpeed4.text = "\(YYY[4].windSpeedString) km/hr"
        uvi4.text = YYY[4].uviString
        if YYY[4].uvi > 11 {
            self.uvi4.backgroundColor = UIColor.systemRed
        } else if YYY[4].uvi > 8 {
            self.uvi4.backgroundColor = UIColor.systemOrange
        } else if YYY[4].uvi > 6 {
            self.uvi4.backgroundColor = UIColor.systemYellow
        } else if YYY[4].uvi > 3 {
            self.uvi4.backgroundColor = UIColor.systemGreen
        } else if YYY[4].uvi >= 0 {
            self.uvi4.backgroundColor = UIColor.systemTeal
        }
//        condition4.image = UIImage(systemName: YYY[4].conditionNameId)?.withRenderingMode(.alwaysOriginal)
        condition4.image = UIImage(systemName: YYY[4].conditionNameId)
        
        _ = dateFormatter.string(from: NSDate(timeIntervalSince1970: TimeInterval(YYY[4].dt)) as Date)

        
        date1Label.text = dateFormatter.string(from: NSDate(timeIntervalSince1970: TimeInterval(XXX[1].dt)) as Date)
        date2Label.text = dateFormatter.string(from: NSDate(timeIntervalSince1970: TimeInterval(XXX[2].dt)) as Date)
        date3Label.text = dateFormatter.string(from: NSDate(timeIntervalSince1970: TimeInterval(XXX[3].dt)) as Date)
        date4Label.text = dateFormatter.string(from: NSDate(timeIntervalSince1970: TimeInterval(XXX[4].dt)) as Date)
        
        aqi1Label.text = XXX[1].aqiString
        if XXX[1].aqi == 5 {
            aqi1Label.backgroundColor = UIColor.systemRed
        } else if XXX[1].aqi == 4 {
            aqi1Label.backgroundColor = UIColor.systemOrange
        } else if XXX[1].aqi == 3 {
            aqi1Label.backgroundColor = UIColor.systemYellow
        } else if XXX[1].aqi == 2 {
            aqi1Label.backgroundColor = UIColor.systemGreen
        } else if XXX[1].aqi == 1 {
            aqi1Label.backgroundColor = UIColor.systemTeal
        }
        
        aqi2Label.text = XXX[2].aqiString
        if XXX[2].aqi == 5 {
            aqi2Label.backgroundColor = UIColor.systemRed
        } else if XXX[2].aqi == 4 {
            aqi2Label.backgroundColor = UIColor.systemOrange
        } else if XXX[2].aqi == 3 {
            aqi2Label.backgroundColor = UIColor.systemYellow
        } else if XXX[2].aqi == 2 {
            aqi2Label.backgroundColor = UIColor.systemGreen
        } else if XXX[2].aqi == 1 {
            aqi2Label.backgroundColor = UIColor.systemTeal
        }
        
        aqi3Label.text = XXX[3].aqiString
        if XXX[3].aqi == 5 {
            aqi3Label.backgroundColor = UIColor.systemRed
        } else if XXX[3].aqi == 4 {
            aqi3Label.backgroundColor = UIColor.systemOrange
        } else if XXX[3].aqi == 3 {
            aqi3Label.backgroundColor = UIColor.systemYellow
        } else if XXX[3].aqi == 2 {
            aqi3Label.backgroundColor = UIColor.systemGreen
        } else if XXX[3].aqi == 1 {
            aqi3Label.backgroundColor = UIColor.systemTeal
        }
        
        aqi4Label.text = XXX[4].aqiString
        if XXX[4].aqi == 5 {
            aqi4Label.backgroundColor = UIColor.systemRed
        } else if XXX[4].aqi == 4 {
            aqi4Label.backgroundColor = UIColor.systemOrange
        } else if XXX[4].aqi == 3 {
            aqi4Label.backgroundColor = UIColor.systemYellow
        } else if XXX[4].aqi == 2 {
            aqi4Label.backgroundColor = UIColor.systemGreen
        } else if XXX[4].aqi == 1 {
            aqi4Label.backgroundColor = UIColor.systemTeal
        }
        
        pm2_5_1Label.text = XXX[1].pm2_5String
        if XXX[1].pm2_5 > 50 {
            pm2_5_1Label.backgroundColor = UIColor.systemRed
        } else if XXX[1].pm2_5 > 25 {
            pm2_5_1Label.backgroundColor = UIColor.systemOrange
        } else if XXX[1].pm2_5 > 20 {
            pm2_5_1Label.backgroundColor = UIColor.systemYellow
        } else if XXX[1].pm2_5 > 10 {
            pm2_5_1Label.backgroundColor = UIColor.systemGreen
        } else if XXX[1].pm2_5 >= 0 {
            pm2_5_1Label.backgroundColor = UIColor.systemTeal
        }
        
        pm2_5_2Label.text = XXX[2].pm2_5String
        if XXX[2].pm2_5 > 50 {
            pm2_5_2Label.backgroundColor = UIColor.systemRed
        } else if XXX[2].pm2_5 > 25 {
            pm2_5_2Label.backgroundColor = UIColor.systemOrange
        } else if XXX[2].pm2_5 > 20 {
            pm2_5_2Label.backgroundColor = UIColor.systemYellow
        } else if XXX[2].pm2_5 > 10 {
            pm2_5_2Label.backgroundColor = UIColor.systemGreen
        } else if XXX[2].pm2_5 >= 0 {
            pm2_5_2Label.backgroundColor = UIColor.systemTeal
        }
        
        pm2_5_3Label.text = XXX[3].pm2_5String
        if XXX[3].pm2_5 > 50 {
            pm2_5_3Label.backgroundColor = UIColor.systemRed
        } else if XXX[3].pm2_5 > 25 {
            pm2_5_3Label.backgroundColor = UIColor.systemOrange
        } else if XXX[3].pm2_5 > 20 {
            pm2_5_3Label.backgroundColor = UIColor.systemYellow
        } else if XXX[3].pm2_5 > 10 {
            pm2_5_3Label.backgroundColor = UIColor.systemGreen
        } else if XXX[3].pm2_5 >= 0 {
            pm2_5_3Label.backgroundColor = UIColor.systemTeal
        }
        
        pm2_5_4Label.text = XXX[4].pm2_5String
        if XXX[4].pm2_5 > 50 {
            pm2_5_4Label.backgroundColor = UIColor.systemRed
        } else if XXX[4].pm2_5 > 25 {
            pm2_5_4Label.backgroundColor = UIColor.systemOrange
        } else if XXX[4].pm2_5 > 20 {
            pm2_5_4Label.backgroundColor = UIColor.systemYellow
        } else if XXX[4].pm2_5 > 10 {
            pm2_5_4Label.backgroundColor = UIColor.systemGreen
        } else if XXX[4].pm2_5 >= 0 {
            pm2_5_4Label.backgroundColor = UIColor.systemTeal
        }
        
        pm10_1Label.text = XXX[1].pm10String
        if XXX[1].pm10 > 100 {
            pm10_1Label.backgroundColor = UIColor.systemRed
        } else if XXX[1].pm10 > 50 {
            pm10_1Label.backgroundColor = UIColor.systemOrange
        } else if XXX[1].pm10 > 40 {
            pm10_1Label.backgroundColor = UIColor.systemYellow
        } else if XXX[1].pm10 > 20 {
            pm10_1Label.backgroundColor = UIColor.systemGreen
        } else if XXX[1].pm10 >= 0 {
            pm10_1Label.backgroundColor = UIColor.systemTeal
        }
        
        pm10_2Label.text = XXX[2].pm10String
        if XXX[2].pm10 > 100 {
            pm10_2Label.backgroundColor = UIColor.systemRed
        } else if XXX[2].pm10 > 50 {
            pm10_2Label.backgroundColor = UIColor.systemOrange
        } else if XXX[2].pm10 > 40 {
            pm10_2Label.backgroundColor = UIColor.systemYellow
        } else if XXX[2].pm10 > 20 {
            pm10_2Label.backgroundColor = UIColor.systemGreen
        } else if XXX[2].pm10 >= 0 {
            pm10_2Label.backgroundColor = UIColor.systemTeal
        }
        
        pm10_3Label.text = XXX[3].pm10String
        if XXX[3].pm10 > 100 {
            pm10_3Label.backgroundColor = UIColor.systemRed
        } else if XXX[3].pm10 > 50 {
            pm10_3Label.backgroundColor = UIColor.systemOrange
        } else if XXX[3].pm10 > 40 {
            pm10_3Label.backgroundColor = UIColor.systemYellow
        } else if XXX[3].pm10 > 20 {
            pm10_3Label.backgroundColor = UIColor.systemGreen
        } else if XXX[3].pm10 >= 0 {
            pm10_3Label.backgroundColor = UIColor.systemTeal
        }
        
        pm10_4Label.text = XXX[4].pm10String
        if XXX[4].pm10 > 100 {
            pm10_4Label.backgroundColor = UIColor.systemRed
        } else if XXX[4].pm10 > 50 {
            pm10_4Label.backgroundColor = UIColor.systemOrange
        } else if XXX[4].pm10 > 40 {
            pm10_4Label.backgroundColor = UIColor.systemYellow
        } else if XXX[4].pm10 > 20 {
            pm10_4Label.backgroundColor = UIColor.systemGreen
        } else if XXX[4].pm10 >= 0 {
            pm10_4Label.backgroundColor = UIColor.systemTeal
        }
        
        no2_1Label.text = XXX[1].no2String
        if XXX[1].no2 > 230 {
            no2_1Label.backgroundColor = UIColor.systemRed
        } else if XXX[1].no2 > 120 {
            no2_1Label.backgroundColor = UIColor.systemOrange
        } else if XXX[1].no2 > 90 {
            no2_1Label.backgroundColor = UIColor.systemYellow
        } else if XXX[1].no2 > 40 {
            no2_1Label.backgroundColor = UIColor.systemGreen
        } else if XXX[1].no2 >= 0 {
            no2_1Label.backgroundColor = UIColor.systemTeal
        }
        
        no2_2Label.text = XXX[2].no2String
        if XXX[2].no2 > 230 {
            no2_2Label.backgroundColor = UIColor.systemRed
        } else if XXX[2].no2 > 120 {
            no2_2Label.backgroundColor = UIColor.systemOrange
        } else if XXX[2].no2 > 90 {
            no2_2Label.backgroundColor = UIColor.systemYellow
        } else if XXX[2].no2 > 40 {
            no2_2Label.backgroundColor = UIColor.systemGreen
        } else if XXX[2].no2 >= 0 {
            no2_2Label.backgroundColor = UIColor.systemTeal
        }
        
        no2_3Label.text = XXX[3].no2String
        if XXX[3].no2 > 230 {
            no2_3Label.backgroundColor = UIColor.systemRed
        } else if XXX[3].no2 > 120 {
            no2_3Label.backgroundColor = UIColor.systemOrange
        } else if XXX[3].no2 > 90 {
            no2_3Label.backgroundColor = UIColor.systemYellow
        } else if XXX[3].no2 > 40 {
            no2_3Label.backgroundColor = UIColor.systemGreen
        } else if XXX[3].no2 >= 0 {
            no2_3Label.backgroundColor = UIColor.systemTeal
        }
        
        
        no2_4Label.text = XXX[4].no2String
        if XXX[4].no2 > 230 {
            no2_4Label.backgroundColor = UIColor.systemRed
        } else if XXX[4].no2 > 120 {
            no2_4Label.backgroundColor = UIColor.systemOrange
        } else if XXX[4].no2 > 90 {
            no2_4Label.backgroundColor = UIColor.systemYellow
        } else if XXX[4].no2 > 40 {
            no2_4Label.backgroundColor = UIColor.systemGreen
        } else if XXX[4].no2 >= 0 {
            no2_4Label.backgroundColor = UIColor.systemTeal
        }
        
        o3_1Label.text = XXX[1].o3String
        if XXX[1].o3 > 240 {
            o3_1Label.backgroundColor = UIColor.systemRed
        } else if XXX[1].o3 > 130 {
            o3_1Label.backgroundColor = UIColor.systemOrange
        } else if XXX[1].o3 > 100 {
            o3_1Label.backgroundColor = UIColor.systemYellow
        } else if XXX[1].o3 > 50 {
            o3_1Label.backgroundColor = UIColor.systemGreen
        } else if XXX[1].o3 >= 0 {
            o3_1Label.backgroundColor = UIColor.systemTeal
        }
        
        o3_2Label.text = XXX[2].o3String
        if XXX[2].o3 > 240 {
            o3_2Label.backgroundColor = UIColor.systemRed
        } else if XXX[2].o3 > 130 {
            o3_2Label.backgroundColor = UIColor.systemOrange
        } else if XXX[2].o3 > 100 {
            o3_2Label.backgroundColor = UIColor.systemYellow
        } else if XXX[2].o3 > 50 {
            o3_2Label.backgroundColor = UIColor.systemGreen
        } else if XXX[2].o3 >= 0 {
            o3_2Label.backgroundColor = UIColor.systemTeal
        }
        
        o3_3Label.text = XXX[3].o3String
        if XXX[3].o3 > 240 {
            o3_3Label.backgroundColor = UIColor.systemRed
        } else if XXX[3].o3 > 130 {
            o3_3Label.backgroundColor = UIColor.systemOrange
        } else if XXX[3].o3 > 100 {
            o3_3Label.backgroundColor = UIColor.systemYellow
        } else if XXX[3].o3 > 50 {
            o3_3Label.backgroundColor = UIColor.systemGreen
        } else if XXX[3].o3 >= 0 {
            o3_3Label.backgroundColor = UIColor.systemTeal
        }
        
        o3_4Label.text = XXX[4].o3String
        if XXX[4].o3 > 240 {
            o3_4Label.backgroundColor = UIColor.systemRed
        } else if XXX[4].o3 > 130 {
            o3_4Label.backgroundColor = UIColor.systemOrange
        } else if XXX[4].o3 > 100 {
            o3_4Label.backgroundColor = UIColor.systemYellow
        } else if XXX[4].o3 > 50 {
            o3_4Label.backgroundColor = UIColor.systemGreen
        } else if XXX[4].o3 >= 0 {
            o3_4Label.backgroundColor = UIColor.systemTeal
        }
        
        so2_1Label.text = XXX[1].so2String
        if XXX[1].so2 > 500 {
            so2_1Label.backgroundColor = UIColor.systemRed
        } else if XXX[1].so2 > 350 {
            so2_1Label.backgroundColor = UIColor.systemOrange
        } else if XXX[1].so2 > 200 {
            so2_1Label.backgroundColor = UIColor.systemYellow
        } else if XXX[1].so2 > 100 {
            so2_1Label.backgroundColor = UIColor.systemGreen
        } else if XXX[1].so2 >= 0 {
            so2_1Label.backgroundColor = UIColor.systemTeal
        }
        
        so2_2Label.text = XXX[2].so2String
        if XXX[2].so2 > 500 {
            so2_2Label.backgroundColor = UIColor.systemRed
        } else if XXX[2].so2 > 350 {
            so2_2Label.backgroundColor = UIColor.systemOrange
        } else if XXX[2].so2 > 200 {
            so2_2Label.backgroundColor = UIColor.systemYellow
        } else if XXX[2].so2 > 100 {
            so2_2Label.backgroundColor = UIColor.systemGreen
        } else if XXX[2].so2 >= 0 {
            so2_2Label.backgroundColor = UIColor.systemTeal
        }
        
        so2_3Label.text = XXX[3].so2String
        if XXX[3].so2 > 500 {
            so2_3Label.backgroundColor = UIColor.systemRed
        } else if XXX[3].so2 > 350 {
            so2_3Label.backgroundColor = UIColor.systemOrange
        } else if XXX[3].so2 > 200 {
            so2_3Label.backgroundColor = UIColor.systemYellow
        } else if XXX[3].so2 > 100 {
            so2_3Label.backgroundColor = UIColor.systemGreen
        } else if XXX[3].so2 >= 0 {
            so2_3Label.backgroundColor = UIColor.systemTeal
        }
        
        so2_4Label.text = XXX[4].so2String
        if XXX[4].so2 > 500 {
            so2_4Label.backgroundColor = UIColor.systemRed
        } else if XXX[4].so2 > 350 {
            so2_4Label.backgroundColor = UIColor.systemOrange
        } else if XXX[4].so2 > 200 {
            so2_4Label.backgroundColor = UIColor.systemYellow
        } else if XXX[4].so2 > 100 {
            so2_4Label.backgroundColor = UIColor.systemGreen
        } else if XXX[4].so2 >= 0 {
            so2_4Label.backgroundColor = UIColor.systemTeal
        }
    
        co1Label.text = XXX[1].coString
        co2Label.text = XXX[2].coString
        co3Label.text = XXX[3].coString
        co4Label.text = XXX[4].coString
        
        no1Label.text = XXX[1].noString
        no2Label.text = XXX[2].noString
        no3Label.text = XXX[3].noString
        no4Label.text = XXX[4].noString

        nh3_1Label.text = XXX[1].nh3String
        nh3_2Label.text = XXX[2].nh3String
        nh3_3Label.text = XXX[3].nh3String
        nh3_4Label.text = XXX[4].nh3String
        
    }
}

