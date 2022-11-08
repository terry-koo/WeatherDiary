//
//  CurrentWeatherView.swift
//  WeatherDiary
//
//  Created by KiWoong Hong on 2022/10/29.
//

import SwiftUI
import WeatherKit

struct CurrentWeatherView: View {
    
    @EnvironmentObject var locationManager: LocationManager
    @State private var angle = 0.0
    
    var weather: Weather
    
    var body: some View {
        VStack {
            Text("\(weather.currentWeather.date.basicWithDay)")
                .font(Font.weatherTitle)
            HStack {
                Text("\(locationManager.locality ?? "") \(weather.currentWeather.condition.koreanValue)")
                    .font(Font.weatherLargeTitle)
                Image(weather.currentWeather.condition.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height : 55)
                    .rotationEffect(.degrees(angle))
                    .animation(.timingCurve(0, 0.8, 0.2, 1, duration: 10), value: angle)
                    .onTapGesture { angle += Double.random(in: 3600 ..< 3960) }
            }
            .padding(.vertical, 50)
            HStack {
                Text("\(Int(weather.currentWeather.temperature.value))°C")
                    .font(Font.weatherLargeTitle)
                    .padding(15)
                VStack {
                    Text("최고")
                    Text("\(Int(weather.dailyForecast.first?.highTemperature.value ?? 0))°C")
                }
                    .font(Font.weatherTitle)
                    .padding(15)
                VStack {
                    Text("최저")
                    Text("\(Int(weather.dailyForecast.first?.lowTemperature.value ?? 0))°C")
                }
                    .font(Font.weatherTitle)
                    .padding(15)
            }
        }
        .padding(.top, 40)
        .frame(maxWidth: .infinity)
    }
}

