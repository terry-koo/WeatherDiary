//
//  WeeklyWeatherListView.swift
//  WeatherDiary
//
//  Created by KiWoong Hong on 2022/10/29.
//

import SwiftUI
import WeatherKit

struct WeeklyWeatherListView: View {
    
    var weather: Weather
    
    var body: some View {
        VStack {
            WeeklyWeatherCellView(dayWeather: weather.dailyForecast.forecast.first!, isFirst: true)
            ForEach(weather.dailyForecast.forecast[1..<10], id: \.date) { dayWeather in
                WeeklyWeatherCellView(dayWeather: dayWeather)
            }
        }
        .padding(.top, 15)
    }
}

struct WeeklyWeatherCellView: View {
    
    var dayWeather: DayWeather
    var isFirst: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Text("\(isFirst ? "오늘  " : dayWeather.date.onlyDay)")
                    .font(Font.weatherBody)
                Image(systemName: dayWeather.symbolName)
                Spacer()
                Text("최저 \(Int(dayWeather.lowTemperature.value))°C 최고 \(Int(dayWeather.highTemperature.value))°C")
                    .font(Font.weatherBody)
            }
            .foregroundColor(Color.black)
            .padding(.horizontal, 30)
            Image("weeklyLine")
        }
    }
}

