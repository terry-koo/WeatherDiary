//
//  WeatherInfoView.swift
//  WeatherDiary
//
//  Created by KiWoong Hong on 2022/10/29.
//

import SwiftUI
import WeatherKit

struct WeatherInfoView: View {
    
    let weatherService = WeatherService.shared
    @StateObject private var locationManager = LocationManager()
    @State private var weather: Weather?
    
    var body: some View {
        ScrollView {
            if let weather {
               // currentWeatherView
                CurrentWeatherView(weather: weather)
                HourlyWeatherListView()
                WeeklyWeatherListView()
            }
            
            // currentWeather: CurrentWeather = weather.currentWeather
            // hourWeathers: [HourWeather] = weather.hourlyForecast.forecast
            // dayWeathers: [DayWeather] = weather.dailyForecast.forecast
            
            // when changed locationManager.currentLocation
            // redo task
        }
        .task(id: locationManager.currentLocation) {
            do {
                
                if let location = locationManager.currentLocation {
                    self.weather = try await weatherService.weather(for: location)
                }
            } catch {
                print(error)
            }
        }
    }
}

extension WeatherInfoView {
    var currentWeatherView: some View {
        VStack {
            Text("2022년 10월 28일 목요일")
                .font(Font.weatherTitle)
            HStack {
                Text("(지역) (날씨)")
                    .font(Font.weatherLargeTitle)
                Image("sun")
                    .resizable()
                    .scaledToFit()
                    .frame(height : 60)
            }
            .padding(.vertical, 50)
            HStack {
                Text("\(Int(weather?.currentWeather.temperature.value ?? 0))°C")
                    .font(Font.weatherLargeTitle)
                VStack {
                    Text("최고")
                    Text("\(Int(weather?.dailyForecast.first?.highTemperature.value ?? 0))°C")
                }
                .font(Font.weatherTitle)
                VStack {
                    Text("최저")
                    Text("\(Int(weather?.dailyForecast.first?.lowTemperature.value ?? 0))°C")
                }
                .font(Font.weatherTitle)
            }
        }
        .padding(.top, 40)
        .frame(maxWidth: .infinity)
    }
}

struct WeatherInfoView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherInfoView()
    }
}
