//
//  HourlyWeatherListView.swift
//  WeatherDiary
//
//  Created by KiWoong Hong on 2022/10/29.
//

import SwiftUI
import WeatherKit

struct HourlyWeatherListView: View {
    
    var weather: Weather
    var body: some View {
        let hourlyWeathers: [HourWeather] = weather.hourlyForecast.forecast.filter {
            $0.date >= Date.now.addingTimeInterval(-3600)
        }
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                HourlyWeatherCellView(isFirst: true, hourlyWeather: hourlyWeathers.first!)
                ForEach(hourlyWeathers[1..<24], id: \.date) { hourlyWeather in
                    HourlyWeatherCellView(hourlyWeather: hourlyWeather)
                }
            }
            .padding(.leading, 20)
        }
    }
}

struct HourlyWeatherCellView: View {
    
    var isFirst: Bool = false
    let hourlyWeather: HourWeather
    
    var body: some View {
        Image("card")
            .overlay {
                VStack {
                    Text("\(isFirst ? "지금" : hourlyWeather.date.timeOnlyHour)")
                        .font(Font.weatherBody)
                        .padding(.top, 3)
                    Image(systemName: hourlyWeather.symbolName)
                        .resizable()
                        .scaledToFit()
                    Text("\(Int(hourlyWeather.temperature.value))°C")
                        .font(Font.weatherBody)
                        .padding(.bottom, 3)
                }
            }
    }
}

