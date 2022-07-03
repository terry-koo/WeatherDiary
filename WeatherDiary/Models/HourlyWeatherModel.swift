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
    var icon: String
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
