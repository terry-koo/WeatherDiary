//
//  CurrentWeatherView.swift
//  WeatherDiary
//
//  Created by KiWoong Hong on 2022/10/29.
//

import SwiftUI
import WeatherKit

struct CurrentWeatherView: View {
    var weather: Weather
    var body: some View {
        VStack {
            // TODO: 날짜 텍스트 수정해야함
            Text("\(weather.currentWeather.date)")
            //Text("2022년 10월 28일 목요일")
                .font(Font.weatherTitle)
            HStack {
                //TODO: 지역 날씨 수정해야함
                Text("(지역) (날씨)")
                    .font(Font.weatherLargeTitle)
                Image("sun")
                    .resizable()
                    .scaledToFit()
                    .frame(height : 60)
            }
            .padding(.vertical, 50)
            HStack {
                Text("\(Int(weather.currentWeather.temperature.value))°C")
                    .font(Font.weatherLargeTitle)
                VStack {
                    Text("최고")
                    Text("\(Int(weather.dailyForecast.first?.highTemperature.value ?? 0))°C")
                }
                .font(Font.weatherTitle)
                VStack {
                    Text("최저")
                    Text("\(Int(weather.dailyForecast.first?.lowTemperature.value ?? 0))°C")
                }
                .font(Font.weatherTitle)
            }
        }
        .padding(.top, 40)
        .frame(maxWidth: .infinity)
    }
}
/*
struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView()
    }
}*/
