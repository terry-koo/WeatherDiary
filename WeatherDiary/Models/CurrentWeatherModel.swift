//
//  CurrentWeatherModel.swift
//  WeatherDiary
//
//  Created by Terry Koo on 2022/07/07.
//

import Foundation

struct CurrentWeather {
    var condition: String? {
        if Int(self.pop!)! > 50 {
            switch self.pty {
            case "1":
                return "비"
            case "2":
                return "비/눈"
            case "3":
                return "눈"
            case "4":
                return "소나기"
            default:
                return "없음"
            }
        } else {
            switch Int(self.sky!)! {
            case 0..<5:
                return "맑음"
            case 6..<8:
                return "구름많음"
            case 9..<10:
                return "흐림"
            default:
                return "없음"
            }
        }
    }
    var currentImage: String {
        switch condition {
        case "비": return "rain"
        case "비/눈": return "snowRain"
        case "눈": return "snow"
        case "소나기": return "rain"
        case "맑음": return "sun"
        case "구름많음": return "cloudy"
        case "흐림": return "cloudy"
        case "없음": return "rain"
        default: return "sun"
        }
    }
    var currentTemp: String?
    var highestTemp : String?
    var lowestTemp: String?
    var sky: String?
    var pty: String?
    var pop: String?
}
