//
//  City.swift
//  WeatherToday
//
//  Created by WG Yang on 2022/03/11.
//

import Foundation
import UIKit
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
    var stringState: String {
        switch state {
        case 10:
            return "맑음"
        case 11:
            return "구름"
        case 12:
            return "비"
        case 13:
            return "눈"
        default:
            return ""
        }
    }
    var stringTemperature: String {
        let stringFahrenheit = NSString(format:"%.1f", fahrenheit) as String
        return "섭씨 " + String(celsius) + "도 / 화씨 " + stringFahrenheit + "도"
    }
    
    var stringRainfallProbability: String {
        let s = NSString(format: "%.0f", rainfall_probability) as String
        return "강수확률: " + s + "%"
    }
    
    /*
     10 : sunny
     11 : cloudy
     12 : rainy
     13 : snowy
     */
    var iconState: UIImage {
        
        let emptyImage: UIImage = UIImage()
        
        switch state {
        case 10:
            if let iconImage: UIImage = UIImage(named: "sunny"){
            return iconImage
            } else {
                return emptyImage
            }
        case 11:
            if let iconImage: UIImage = UIImage(named: "cloudy"){
            return iconImage
            } else {
                return emptyImage
            }
        case 12:
            if let iconImage: UIImage = UIImage(named: "rainy"){
            return iconImage
            } else {
                return emptyImage
            }
        case 13:
            if let iconImage: UIImage = UIImage(named: "snowy"){
            return iconImage
            } else {
                return emptyImage
            }
        default:
           return emptyImage
        }
    }
}
