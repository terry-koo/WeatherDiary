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
            ForEach(weather.dailyForecast.forecast[0..<10], id: \.date) { dayWeather in
                WeeklyWeatherCellView(dayWeather: dayWeather)
            //    HourlyWeatherCell
            }
        }
        .padding(.top, 15)
    }
}

struct WeeklyWeatherCellView: View {
    
    var dayWeather: DayWeather
    
    var body: some View {
        VStack {
            HStack {
                Text("\(dayWeather.date.formatted("EE요일"))")
                //Text("요일요일")
                    .font(Font.weatherBody)
                Image(systemName: dayWeather.symbolName)
                Spacer()
                Text("최저 \(Int(dayWeather.lowTemperature.value))°C 최고 \(Int(dayWeather.highTemperature.value))°C")
                    .font(Font.weatherBody)
            }
            .padding(.horizontal, 30)
            Image("weeklyLine")
        }
    }
}
/*
struct WeeklyWeatherListView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyWeatherListView()
    }
}*/
