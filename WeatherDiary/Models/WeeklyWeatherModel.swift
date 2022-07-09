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
    let highestTemperature: String
    let lowestTemperature: String
}

extension WeeklyWeather {
    var dummys: [WeeklyWeather] {
        [
            WeeklyWeather(day: "월", icon: "sun.max", highestTemperature: "32", lowestTemperature: "22"),
            WeeklyWeather(day: "화", icon: "sun.max", highestTemperature: "30", lowestTemperature: "23"),
            WeeklyWeather(day: "수", icon: "sun.max", highestTemperature: "35", lowestTemperature: "17"),
            WeeklyWeather(day: "목", icon: "sun.max", highestTemperature: "32", lowestTemperature: "15"),
            WeeklyWeather(day: "금", icon: "sun.max", highestTemperature: "31", lowestTemperature: "25"),
            WeeklyWeather(day: "토", icon: "sun.max", highestTemperature: "30", lowestTemperature: "22"),
            WeeklyWeather(day: "일", icon: "sun.max", highestTemperature: "31", lowestTemperature: "21"),
        ]
    }
}
