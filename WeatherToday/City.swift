//
//  City.swift
//  WeatherToday
//
//  Created by WG Yang on 2022/03/11.
//

import Foundation
/*
 {
    "city_name":"서울",
    "state":12,
    "celsius":17.8,
    "rainfall_probability":60
 }
 */

struct City: Codable {
    
    let city_name: String
    let state: Int
    let celsius: Float
    let rainfall_probability: Float
    
    var fahrenheit: Float {
        return celsius * 1.8 + 32
    }
    
    var stringTemperature: String {
        let stringFahrenheit = NSString(format:"%.1f", fahrenheit) as String
        return "섭씨 " + String(celsius) + "도 / 화씨 " + stringFahrenheit + "도"
    }
    
    var stringRainfallProbability: String {
        let s = NSString(format: "%.0f", rainfall_probability) as String
        return "강수확률: " + s + "%"
    }
}
