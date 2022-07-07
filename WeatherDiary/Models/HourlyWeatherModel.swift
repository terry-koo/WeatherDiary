//
//  HourlyWeatherModel.swift
//  WeatherDiary
//
//  Created by KiWoong Hong on 2022/07/01.
//

import SwiftUI

struct HourlyWeather: Hashable {
    let time: String
    let temperature: String
    let rainProbabillity: String
    let condition: String
    let sky: String
    var displayTime: String {
        if time == "지금" { return "지금" }
        let formatter = DateFormatter()
        formatter.dateFormat = "HHmm"
        let temp = formatter.date(from: time)
        formatter.dateFormat = "a hh"
        return formatter.string(from: temp ?? Date()) + "시"
    }
    var icon: String {
        if rainProbabillity != "0" {
            if rainProbabillity <= "50" {
                return "cloud.bolt"
            } else { return "cloud.rain" }
        } else if sky >= "5" {
            return "cloud"
        } else {
            return "sun.max"
        }
    }
}

struct ResponseForHourlyWeather: Codable {
    let response: Response
    
    struct Response: Codable {
        let body: Body
    }
    
    struct Body: Codable {
        let dataType: String
        let items: Items
    }
    
    struct Items: Codable {
        let item: [Item]
    }
    
    struct Item: Codable {
        let baseDate: String
        let baseTime: String
        let category: String
        let fcstDate: String
        let fcstTime: String
        let fcstValue: String
        let nx: Int
        let ny: Int
    }
}
