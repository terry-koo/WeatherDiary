//
//  WeeklyWeatherModel.swift
//  WeatherDiary
//
//  Created by KiWoong Hong on 2022/07/09.
//

import Foundation

struct WeeklyWeather: Hashable {
    let day: String
    var icon: String {
        if forecast.rainProbability != 0 {
            return "cloud.rain"
        } else {
            switch forecast.sky {
            case "맑음": return "sun.max"
            case "구름많음", "구름많고 비", "구름많고 눈", "구름많고 비/눈", "구름많고 소나기": return "cloud"
            case "흐림", "흐리고 비", "흐리고 비/눈", "흐리고 소나기": return "smoke"
            default: return "sun.max"
            }
        }
    }
    let forecast: Forecast
    let temperature: Temperature
}

struct Forecast: Hashable {
    let rainProbability: Int
    let sky: String
}
struct Temperature: Hashable {
    let highest: Int
    let lowest: Int
}

extension WeeklyWeather {
    var dummys: [WeeklyWeather] {
        [
            WeeklyWeather(day: "월", forecast: Forecast(rainProbability: 30, sky: "흐림"), temperature: Temperature(highest: 30, lowest: 20)),
            
            WeeklyWeather(day: "화", forecast: Forecast(rainProbability: 30, sky: "흐림"), temperature: Temperature(highest: 30, lowest: 20)),
            WeeklyWeather(day: "수", forecast: Forecast(rainProbability: 30, sky: "흐림"), temperature: Temperature(highest: 30, lowest: 20)),
            WeeklyWeather(day: "목", forecast: Forecast(rainProbability: 30, sky: "흐림"), temperature: Temperature(highest: 30, lowest: 20)),
            WeeklyWeather(day: "금", forecast: Forecast(rainProbability: 30, sky: "흐림"), temperature: Temperature(highest: 30, lowest: 20)),
            WeeklyWeather(day: "토", forecast: Forecast(rainProbability: 30, sky: "흐림"), temperature: Temperature(highest: 30, lowest: 20)),
            WeeklyWeather(day: "일", forecast: Forecast(rainProbability: 30, sky: "흐림"), temperature: Temperature(highest: 30, lowest: 20))
        ]
    }
}
