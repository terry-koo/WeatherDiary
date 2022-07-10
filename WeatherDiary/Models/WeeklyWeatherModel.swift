//
//  WeeklyWeatherModel.swift
//  WeatherDiary
//
//  Created by KiWoong Hong on 2022/07/09.
//

import Foundation

struct WeeklyWeather: Hashable {
    let day: String
    let icon: String
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
            WeeklyWeather(day: "월", icon: "sun.max", forecast: Forecast(rainProbability: 30, sky: "흐림"), temperature: Temperature(highest: 30, lowest: 20)),
            
            WeeklyWeather(day: "화", icon: "sun.max", forecast: Forecast(rainProbability: 30, sky: "흐림"), temperature: Temperature(highest: 30, lowest: 20)),
            WeeklyWeather(day: "수", icon: "sun.max", forecast: Forecast(rainProbability: 30, sky: "흐림"), temperature: Temperature(highest: 30, lowest: 20)),
            WeeklyWeather(day: "목", icon: "sun.max", forecast: Forecast(rainProbability: 30, sky: "흐림"), temperature: Temperature(highest: 30, lowest: 20)),
            WeeklyWeather(day: "금", icon: "sun.max", forecast: Forecast(rainProbability: 30, sky: "흐림"), temperature: Temperature(highest: 30, lowest: 20)),
            WeeklyWeather(day: "토", icon: "sun.max", forecast: Forecast(rainProbability: 30, sky: "흐림"), temperature: Temperature(highest: 30, lowest: 20)),
            WeeklyWeather(day: "일", icon: "sun.max", forecast: Forecast(rainProbability: 30, sky: "흐림"), temperature: Temperature(highest: 30, lowest: 20))
        ]
    }
}
